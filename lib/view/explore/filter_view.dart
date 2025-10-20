import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common/common_widget/filter_row.dart';
import '../../common/common_widget/round_button.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {

  List selectedArr = [

  ];

  List filterCatArr = [
    {
      "id": "1",
      "name": "Eggs",
    },
    {
      "id": "2",
      "name": "Noodles & Pasta",
    },
    {
      "id": "3",
      "name": "Chips & Crisps",
    },
    {
      "id": "4",
      "name": "Fast Food",
    },
  ];

  List filterBrandArr = [
    {
      "id": "1",
      "name": "Individual Collection",
    },
    {
      "id": "2",
      "name": "Egypt Foods",
    },
    {
      "id": "3",
      "name": "Juhayna",
    },
    {
      "id": "4",
      "name": "Arabian Food",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                "assets/img/close.png",
                width: 20,
                height: 20,
              ),
          ),



          title: Text(
            "Filters",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: const Color(0xffF2F3F2),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Column(
              children: [
                
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),

                          Column(
                            children: filterCatArr.map((fObj){
                              return FilterRow(
                                  fObj: fObj,
                                  isSelected: selectedArr.contains(fObj),
                                  onPressed: () {

                                    if(selectedArr.contains(fObj)) {
                                      selectedArr.remove(fObj);
                                    }else{
                                      selectedArr.add(fObj);
                                    }
                                    setState(() {

                                    });
                              });
                          }).toList(),
                          ),

                          const SizedBox(height: 15,),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Brand",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),

                          Column(
                            children: filterBrandArr.map((fObj){
                              return FilterRow(
                                  fObj: fObj,
                                  isSelected: selectedArr.contains(fObj),
                                  onPressed: () {

                                    if(selectedArr.contains(fObj)) {
                                      selectedArr.remove(fObj);
                                    }else{
                                      selectedArr.add(fObj);
                                    }
                                    setState(() {

                                    });
                                  });
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                ),

                RoundButton(title: "Apply Filter", onPressed: (){

                })

            ],),),
    );
  }
}
