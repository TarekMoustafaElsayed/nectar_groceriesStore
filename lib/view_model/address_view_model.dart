import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViewModel extends GetxController {

  final txtName = TextEditingController().obs;
  final txtMobile = TextEditingController().obs;
  final txtAddressLine = TextEditingController().obs;
  final txtCity = TextEditingController().obs;
  final txtState = TextEditingController().obs;
  final txtPostalCode = TextEditingController().obs;
  final txtType = "Home".obs;

  final isLoading = false.obs;

}