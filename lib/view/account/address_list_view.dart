import 'package:flutter/material.dart';
import 'package:nectar_groceries/common/common_widget/address_row.dart';

import '../../common/color_extension.dart';
import 'add_address_view.dart';

class AddressListView extends StatefulWidget {
  const AddressListView({super.key});

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
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

          centerTitle: true,
          title: Text(
            "Delivery Address",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
            ),

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAddressView()));
                },
                icon: Image.asset(
                  "assets/img/add.png",
                  width: 20,
                  height: 20,
                  color: TColor.primaryText,
                )
            ),
          ]
      ),
      backgroundColor: Colors.white,

      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          itemBuilder: (context, index) {
            return const AddressRow();
      }, separatorBuilder: (context, index) => const Divider(color: Colors.black12, height: 1,), itemCount: 5),
    );
  }
}
