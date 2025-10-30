import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nectar_groceries/common/common_widget/product_cell.dart';
import 'package:nectar_groceries/model/explore_category_model.dart';
import 'package:nectar_groceries/model/offer_product_model.dart';
import 'package:nectar_groceries/view/explore/filter_view.dart';
import 'package:nectar_groceries/view_model/explore_item_view_model.dart';

import '../../common/color_extension.dart';
import '../home/product_details_view.dart';

class ExploreDetailView extends StatefulWidget {
  final ExploreCategoryModel eObj;
  const ExploreDetailView({super.key, required this.eObj});

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {

  late ExploreItemViewModel listVM;

  @override
  void initState() {
    super.initState();
    listVM = Get.put( ExploreItemViewModel(widget.eObj) );
  }

  @override
  void dispose() {
    Get.delete<ExploreItemViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )
        ),

        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterView()));
              },
              icon: Image.asset(
                "assets/img/filter_ic.png",
                width: 20,
                height: 20,
              )
          ),
        ],

        title: Text(
          widget.eObj.catName ?? "",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body:  Obx(
            () => GridView.builder(
              padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 20
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: listVM.listArr.length,
              itemBuilder: ((context,index) {
                var pObj = listVM.listArr[index];
                return ProductCell(
                  pObj: pObj,
                  margin: 0,
                  weight: double.maxFinite,
                  onPressed: () async {
                    await Get.to( () => ProductDetails(
                      pObj: pObj,
                    ));
                    listVM.serviceCallList();
                  },
                  onCart: () {},
                );
              }),
            ),
      ),
    );
  }
}
