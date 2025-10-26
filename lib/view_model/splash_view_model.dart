import 'package:get/get.dart';
import 'package:nectar_groceries/model/user_payload_model.dart';
import 'package:nectar_groceries/view/main_tab_view/main_tab_view.dart';

import '../common/globs.dart';
import '../view/login/welcome_view.dart';

class SplashViewModel extends GetxController {
  final userPayload = UserPayloadModel().obs;

  void loadView() async {

    await Future.delayed(const Duration(seconds:3));

    if (Globs.udValueBool(Globs.userLogin)) {
      userPayload.value = UserPayloadModel.fromJson(Globs.udValue(Globs.userPayload));
      Get.to(() => const MainTabView());
    } else {
      Get.to(() => const WelcomeView());
    }
  }

  void logout() {
    userPayload.value = UserPayloadModel();
    Globs.udBoolSet(false, Globs.userLogin);
    Get.to(() => const WelcomeView());
  }

}