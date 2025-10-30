import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';
import 'package:nectar_groceries/model/offer_product_model.dart';
import 'package:nectar_groceries/view/main_tab_view/main_tab_view.dart';

import '../common/service_call.dart';

class FavouriteViewModel extends GetxController {
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;


  @override
  void onInit() {
    super.onInit();

    if(kDebugMode) {
      print("FavouriteModel Init ");
    }

    servicecCallList();

  }



  //ServiceCall
  void servicecCallList() {

    Globs.showHUD();
    ServiceCall.post({

    }, SVKey.svFavorite, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;

      } else {

      }

    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallAddRemoveFavourite(int index) {
    Globs.showHUD();
    ServiceCall.post({
      "prod_id": listArr[index].prodId.toString(),
    }, SVKey.svAddRemoveFavorite, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){
        listArr.removeAt(index);
        Get.snackbar(Globs.appName, resObj[KKey.message]);
      } else {}

    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }

}