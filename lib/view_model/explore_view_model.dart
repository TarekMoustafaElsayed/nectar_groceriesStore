import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';

import '../common/service_call.dart';
import '../model/explore_category_model.dart';

class ExploreViewModel extends GetxController {

  final RxList<ExploreCategoryModel> listArr = <ExploreCategoryModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    if(kDebugMode) {
      print("ExploreViewModel Init ");
    }

    servicecCallList();

  }



  //ServiceCall
  void servicecCallList() {

    Globs.showHUD();
    ServiceCall.post({

    }, SVKey.svExploreList, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){

        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return ExploreCategoryModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;

      } else {

      }

    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }

}