import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';
import 'package:nectar_groceries/view/main_tab_view/main_tab_view.dart';

import '../common/service_call.dart';

class SignUpViewModel extends GetxController {
  final txtUsername = TextEditingController().obs;
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
    //txtUsername.value.text = "User1";
    //txtEmail.value.text = "user1@gmail.com";
    //txtPassword.value.text = "123456";
  }



  //ServiceCall
  void servicecCallSignUp() {

    if(txtUsername.value.text.isEmpty) {
      Get.snackbar(Globs.appName, "Please enter your username");
      return;
    }
    
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
      "username": txtUsername.value.text,
      "email": txtEmail.value.text,
      "password": txtPassword.value.text,
      "dervice_token": ""
    }, SVKey.svSignUp, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){
        var payload = resObj[KKey.payload] as Map? ?? {};

        Globs.udSet(payload, Globs.userPayload);
        Globs.udBoolSet(true, Globs.userLogin);

        Get.delete<SignUpViewModel>();
        Get.to( () => const MainTabView() );

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