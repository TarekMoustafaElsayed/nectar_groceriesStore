import 'package:get/get.dart';
import 'package:nectar_groceries/common/globs.dart';
import 'package:nectar_groceries/model/my_order_model.dart';
import 'package:nectar_groceries/model/product_detail_model.dart';

import '../common/service_call.dart';

class MyOrderDetailViewModel extends GetxController {

  final MyOrderModel mObj;
  final sOrderObj = MyOrderModel().obs;
  final RxList<ProductDetailModel> cartList = <ProductDetailModel>[].obs;

  final isShowDetail = true.obs;
  final isShowNutrition = true.obs;

  MyOrderDetailViewModel(this.mObj);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    serviceCallDetail();
  }

  void serviceCallDetail () {
    Globs.showHUD();
    ServiceCall.post({
      "order_id": mObj.orderId.toString(),
    }, SVKey.svMyOrdersDetail, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if ( resObj[KKey.status] == "1" ){
        var payload = resObj[KKey.payload];

        sOrderObj.value = MyOrderModel.fromJson(payload);

        var nutritionDataArr = (payload["cart_list"] as List ? ?? []).map((oObj) {
          return ProductDetailModel.fromJson(oObj);
        }).toList();

        cartList.value = nutritionDataArr;

      } else {}

    }, failure: (err) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, err.toString());
    });
  }
}