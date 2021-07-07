

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {

    super.onInit();
  }

  goToLoginPage(BuildContext context){

    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(
        context,
        '/loginScreen',
      );
    });



  }
}