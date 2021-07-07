import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  @override
  void onInit() {

    super.onInit();
  }
  goToLandingPage({BuildContext context}){

    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(
        context,
        '/landingPage',
      );
    });



  }

  login(context) async {
    final LoginResult result = await FacebookAuth.instance
        .login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken;
      print(accessToken);
      print(result.message);
        goToLandingPage(context: context);
    }
  }

}