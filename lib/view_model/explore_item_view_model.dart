import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';
import 'package:nectar_groceries/model/explore_category_model.dart';
import 'package:nectar_groceries/model/image_model.dart';
import 'package:nectar_groceries/model/nutrition_model.dart';
import 'package:nectar_groceries/model/offer_product_model.dart';
import 'package:nectar_groceries/model/product_detail_model.dart';

import '../common/service_call.dart';

class ExploreItemViewModel extends GetxController {

  final ExploreCategoryModel pObj;
  final sProductObj = ProductDetailModel().obs;
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;

  ExploreItemViewModel(this.pObj);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    serviceCallList();
  }

  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({
      "cat_id": pObj.catId.toString(),
    }, SVKey.svExploreItemList, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){
        var listDataArr = (resObj[KKey.payload] as List ? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;

      } else {}

    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }

}