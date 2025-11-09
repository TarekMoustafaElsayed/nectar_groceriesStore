import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';
import 'package:nectar_groceries/view/login/forgot_password_set_view.dart';
import 'package:nectar_groceries/view/login/verification_view.dart';
import 'package:nectar_groceries/view_model/login_view_model.dart';

import '../common/service_call.dart';

class ForgotPasswordViewModel extends GetxController {
  final txtEmail = TextEditingController().obs;
  final txtResetCode = TextEditingController().obs;
  final isLoading = false.obs;

  final isShowPassword = false.obs;
  final txtNewPassword = TextEditingController().obs;
  final txtConfirmPassword = TextEditingController().obs;
  Map? forgotResDict;

  @override
  void onInit() {
    super.onInit();

    if(kDebugMode) {
      print("ForgotPasswordViewModel Init ");
    }
    txtEmail.value.text = "test@gmail.com";
  }



  //ServiceCall
  void servicecCallRequest({bool isResend = false}) {

    if(!GetUtils.isEmail( txtEmail.value.text )  ) {
      Get.snackbar(Globs.appName, "Please enter valid email address");
      return;
    }

    Globs.showHUD();

    ServiceCall.post({
      "email": txtEmail.value.text,
    }, SVKey.svForgotPasswordRequest, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){

        if(!isResend){
          Get.to(() => const VerificationView());
        }

      } else {
        Get.snackbar(Globs.appName, resObj["message"].toString());
      }
    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void servicecCallVerify() {

    if(txtResetCode.value.text.length != 4) {
      Get.snackbar(Globs.appName, "Please enter your OTP properly");
      return;
    }

    Globs.showHUD();

    ServiceCall.post({
      "email": txtEmail.value.text,
      "reset_code": txtResetCode.value.text,
    }, SVKey.svForgotPasswordVerify, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1" ){
        forgotResDict = resObj[KKey.payload] as Map? ?? {};
        Get.to(() => const ForgotPasswordSetView());
      } else {
        Get.snackbar(Globs.appName, resObj["message"].toString());
      }
    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void servicecCallSetPassword() {

    if(txtNewPassword.value.text.length < 6) {
      Get.snackbar(Globs.appName, "Please enter new password. New password minimum length is 6 characters");
      return;
    }

    if(txtNewPassword.value.text != txtConfirmPassword.value.text) {
      Get.snackbar(Globs.appName, "The password entered does not match");
      return;
    }

    Globs.showHUD();

    ServiceCall.post({
      "user_id": "${forgotResDict?["user_id"]}",
      "reset_code": "${forgotResDict?["reset_code"]}",
      "new_password": txtNewPassword.value.text
    }, SVKey.svForgotPasswordSetPassword, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1" ){
        Get.back();
        Get.back();
        Get.delete<ForgotPasswordViewModel>();
        Get.snackbar(Globs.appName, resObj["message"].toString());
      } else {
        Get.snackbar(Globs.appName, resObj["message"].toString());
      }
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }
}