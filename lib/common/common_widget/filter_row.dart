import 'package:flutter/material.dart';

import '../color_extension.dart';

class FilterRow extends StatelessWidget {
  final Map fObj;
  final bool isSelected;
  final VoidCallback onPressed;
  const FilterRow({super.key, required this.fObj, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset(
              isSelected ? "assets/img/checkbox_check.png" : "assets/img/checkbox.png",
              width: 25,
              height: 25,
            ),
      
            const SizedBox(width: 15,),
      
            Expanded(
              child: Text(
                fObj["name"],
                style: TextStyle(
                    color: isSelected ? TColor.primary : TColor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],),
      ),
    );
  }
}