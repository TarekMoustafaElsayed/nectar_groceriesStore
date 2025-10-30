import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';
import 'package:nectar_groceries/view/main_tab_view/main_tab_view.dart';
import 'package:nectar_groceries/view_model/splash_view_model.dart';

import '../common/service_call.dart';

class LoginViewModel extends GetxController {
  final txtEmail = TextEditingController().obs;
  final txtPassword = TextEditingController().obs;
  final isShowPassword = false.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    if(kDebugMode) {
      print("LoginViewModel Init ");
    }
    txtEmail.value.text = "test@gmail.com";
    txtPassword.value.text = "123456";
  }



  //ServiceCall
  void servicecCallLogin() {

    if(!GetUtils.isEmail( txtEmail.value.text )  ) {
      Get.snackbar(Globs.appName, "Please enter valid email address");
      return;
    }

    if(txtPassword.value.text.length < 6) {
      Get.snackbar(Globs.appName, "Please enter valid password min 6 characters");
      return;
    }

    Globs.showHUD();

    ServiceCall.post({
    "email": txtEmail.value.text,
    "password": txtPassword.value.text,
      "dervice_token": ""
  }, SVKey.svLogin, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){
        var payload = resObj[KKey.payload] as Map? ?? {};

        Globs.udSet(payload, Globs.userPayload);
        Globs.udBoolSet(true, Globs.userLogin);

        Get.delete<LoginViewModel>();
        Get.find<SplashViewModel>().goAfterLoginMainTab();

      } else {

      }

      Get.snackbar(Globs.appName, resObj["message"].toString());
  }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
}

  void showPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}