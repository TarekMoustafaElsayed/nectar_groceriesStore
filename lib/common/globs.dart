import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../main.dart';

class Globs {
  static const appName = "Online Groceries";

  static const userPayload = "user_payload";
  static const userLogin = "user_login";

  static void showHUD({String status = "loading ....."}) async {
  await Future.delayed(const Duration(milliseconds: 1));
  EasyLoading.show(status: status);
  }
  static void hideHUD() {
    EasyLoading.dismiss();
  }

  static void udSet(dynamic data, String key) {
    var jsonStr = json.encode(data);
    prefs?.setString(key, jsonStr);
  }

  static void udStringSet(String data, String key) {
    prefs?.setString(key, data);
  }

  static void udBoolSet(bool data, String key) {
    prefs?.setBool(key, data);
  }

  static void udIntSet(int data, String key) {
    prefs?.setInt(key, data);
  }

  static void udDoubleSet(double data, String key) {
    prefs?.setDouble(key, data);
  }

  static dynamic udValue(String key) {
    return json.decode(prefs?.get(key) as String? ?? "{}");
  }

  static String udValueString(String key) {
    return prefs?.get(key) as String? ?? "";
  }

  static bool udValueBool(String key) {
    return prefs?.get(key) as bool? ?? false;
  }

  static bool udValueTrueBool(String key) {
    return prefs?.get(key) as bool? ?? true;
  }

  static int udValueInt(String key) {
    return prefs?.get(key) as int? ?? 0;
  }

  static double udValueDouble(String key) {
    return prefs?.get(key) as double? ?? 0.0;
  }

  static void udRemove(String key) {
    prefs?.remove(key);
  }

  static Future<String> timeZone() async {
    try {
      return await FlutterTimezone.getLocalTimezone();
    } on PlatformException {
      return "";
    }
  }
}

class SVKey {
  static final mainUrl = dotenv.env['LOCAL_HOST'] ?? 'http://localhost:3001'; //Replace local host with your own IP Address
  static final baseUrl = '$mainUrl/api/app/';
  static final nodeUrl = mainUrl;

  static final svLogin = '${baseUrl}login';
  static final svSignUp = '${baseUrl}sign_up';
  static final svHome = '${baseUrl}home';
  static final svProductDetail = '${baseUrl}product_detail';
  static final svAddRemoveFavorite = '${baseUrl}add_remove_favorite';
  static final svFavorite = '${baseUrl}favorite_list';
  static final svExploreList = '${baseUrl}explore_category_list';
  static final svExploreItemList = '${baseUrl}explore_category_items_list';

  static final svAddToCart = '${baseUrl}add_to_cart';
  static final svUpdateCart = '${baseUrl}update_cart';
  static final svRemoveCart = '${baseUrl}remove_cart';
  static final svCartList = '${baseUrl}cart_list';
  static final svOrderPlace = '${baseUrl}order_place';

  static final svAddDeliveryAddress = '${baseUrl}add_delivery_address';
  static final svUpdateDeliveryAddress = '${baseUrl}update_delivery_address';
  static final svDeleteDeliveryAddress = '${baseUrl}delete_delivery_address';
  static final svDeliveryAddress = '${baseUrl}delivery_address';

  static final svAddPaymentMethod = '${baseUrl}add_payment_method';
  static final svRemovePaymentMethod = '${baseUrl}remove_payment_method';
  static final svPaymentMethodList = '${baseUrl}payment_method';

  static final svMarkDefaultDeliveryAddress = '${baseUrl}mark_default_delivery_address';

  static final svPromoCodeList = '${baseUrl}promo_code_list';
  static final svMyOrders = '${baseUrl}my_order';
  static final svMyOrdersDetail = '${baseUrl}my_order_detail';

  static final svNotificationList = '${baseUrl}notification_list';
  static final svNotificationReadAll = '${baseUrl}notification_read_all';

  static final svUpdateProfile = '${baseUrl}update_profile';
  static final svChangePassword = '${baseUrl}change_password';
  static final svForgotPasswordRequest = '${baseUrl}forgot_password_request';
  static final svForgotPasswordVerify = '${baseUrl}forgot_password_verify';
  static final svForgotPasswordSetPassword = '${baseUrl}forgot_password_set_password';

  static final svProductRatingReview = "${baseUrl}order_product_review_add";
}

class KKey {
  static const payload = "payload";
  static const status = "status";
  static const message = "message";
  static const authToken = "auth_token";
  static const name = "name";
  static const email = "email";
  static const mobile = "mobile";
  static const address = "address";
  static const userId = "user_id";
  static const resetCode = "reset_code";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
// static const  = "";
}

class MSG {
  static const enterEmail = "Please enter your valid email address.";
  static const enterName = "Please enter your name.";
  static const enterCode = "Please enter valid reset code.";

  static const enterMobile = "Please enter your valid mobile number.";
  static const enterAddress = "Please enter your address.";
  static const enterPassword =
      "Please enter password minimum 6 characters at least.";
  static const enterPasswordNotMatch = "Please enter password not match.";
  static const success = "success";
  static const fail = "fail";
}