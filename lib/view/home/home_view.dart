import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nectar_groceries/common/common_widget/category_cell.dart';
import 'package:nectar_groceries/common/common_widget/product_cell.dart';
import 'package:nectar_groceries/common/common_widget/section_view.dart';
import 'package:nectar_groceries/model/offer_product_model.dart';
import 'package:nectar_groceries/view/home/product_details_view.dart';
import 'package:nectar_groceries/view_model/home_view_model.dart';

import '../../common/color_extension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  final homeVM = Get.put( HomeViewModel() );

  /*List execlusiveOfferArr = [
    {
      "name" : "Organic Bananas",
      "icon" : "assets/img/banana.png",
      "qty" : "7",
      "unit" : "pcs, Prices",
      "price" : "\$1.99"
    },
    {
      "name" : "Red Apple",
      "icon" : "assets/img/apple_red.png",
      "qty" : "1",
      "unit" : "kg, Prices",
      "price" : "\$4.99"
    }
  ];*/

  List bestSellingArr = [
    {
      "name" : "Red Bell Pepper",
      "icon" : "assets/img/bell_pepper_red.png",
      "qty" : "1",
      "unit" : "kg, Prices",
      "price" : "\$2.99"
    },
    {
      "name" : "Ginger",
      "icon" : "assets/img/ginger.png",
      "qty" : "250",
      "unit" : "gm, Prices",
      "price" : "\$3.99"
    }
  ];

  List groceriesArr = [
    {
      "name" : "Pulses",
      "icon" : "assets/img/pulses.png",
      "color" : Color(0xffF8A44C),
    },
    {
      "name" : "Rice",
      "icon" : "assets/img/rice.png",
      "color" : Color(0xff53B175),
    },
  ];

  List listArr = [
    {
      "name" : "Beef Bone",
      "icon" : "assets/img/beef_bone.png",
      "qty" : "1",
      "unit" : "kg, Prices",
      "price" : "\$4.99"
    },
    {
      "name" : "Broiler Chicken",
      "icon" : "assets/img/broiler_chicken.png",
      "qty" : "1",
      "unit" : "kg, Prices",
      "price" : "\$4.99"
    }
  ];

  @override
  Widget build(BuildContext context){
    var media = MediaQuery.sizeOf(context);
    return Scaffold(

          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/color_logo.png", width: 25 , ),
                      ],
                    ),

                    const SizedBox(height: 4,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/location.png", width: 16, height: 16,),
                        const SizedBox(width: 8,),
                        Text(
                          "New Cairo, First Settlement",
                          style: TextStyle(
                              color: TColor.darkGray,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xffF2F3F2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: txtSearch,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 16),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Image.asset("assets/img/search.png", width: 20, height: 20,),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Search Store",
                                hintStyle: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                            ),
                          ),
                        ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.maxFinite,
                        height: 115,
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F3F2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/img/banner_top.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SectionView(
                        title: "Exclusive Offer",
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20
                        ),
                        onPressed: () {},
                    ),



                    SizedBox(
                      height: 230,
                      child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: homeVM.offerArr.length,
                          itemBuilder: (context,index){

                            var pObj = homeVM.offerArr[index];

                            return ProductCell(
                              pObj: pObj,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetails()));
                              },
                              onCart: (){},
                            );
                      } ),
                      ),
                    ),

                    SectionView(
                      title: "Best Selling",
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(
                      height: 230,
                      child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: homeVM.bestSellingArr.length,
                          itemBuilder: (context,index){

                            var pObj = homeVM.bestSellingArr[index];

                            return ProductCell(
                              pObj: pObj,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetails()));
                              },
                              onCart: (){},
                            );
                          }),
                      ),
                    ),

                    SectionView(
                      title: "Groceries",
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(
                      height: 100,
                      child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: homeVM.groceriesArr.length,
                          itemBuilder: (context,index){

                            var pObj = homeVM.groceriesArr[index];

                            return CategoryCell(
                              pObj: pObj,
                              onPressed: (){},
                            );
                          } ),
                      ),
                    ),

                    const SizedBox(height: 15,),

                    SizedBox(
                      height: 230,
                      child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: homeVM.listArr.length,
                          itemBuilder: (context,index){

                            var pObj = homeVM.listArr[index];

                            return ProductCell(
                              pObj: pObj,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetails()));
                              },
                              onCart: (){},
                            );
                          } ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
