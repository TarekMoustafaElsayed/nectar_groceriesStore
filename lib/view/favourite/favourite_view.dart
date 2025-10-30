import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nectar_groceries/view_model/favourite_view_model.dart';

import '../../common/color_extension.dart';
import '../../common/common_widget/favourite_row.dart';
import '../../common/common_widget/round_button.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {

  final favVM = Get.find<FavouriteViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Favourites",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemCount: favVM.listArr.length,
              separatorBuilder: (context, index) => const Divider(color: Colors.black26, height: 1,),
              itemBuilder: (context, index) {
                var pObj = favVM.listArr[index];
                return FavouriteRow(pObj: pObj, onPressed: (){

                },);
              }
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                RoundButton(title: "Add All To Cart", onPressed: (){

                })
              ],),
          ),
        ],
      ),
    );
  }

}
