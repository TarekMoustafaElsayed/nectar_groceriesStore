import 'package:flutter/material.dart';

import '../color_extension.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 2)],
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 15),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Title",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: TColor.secondaryText.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "Address Line 1,",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    "235235354334",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),


                ],
              ),
             ),
            ),

          IconButton(onPressed: (){},
            icon: Image.asset(
              "assets/img/close.png",
              width: 15,
              height: 15,
            ),),
        ],
      ),
    );
  }
}
