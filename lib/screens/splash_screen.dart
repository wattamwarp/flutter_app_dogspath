import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_dogspath/constants/colors.dart';
import 'package:flutter_app_dogspath/constants/images.dart';
import 'package:flutter_app_dogspath/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController _splashController = Get.put(SplashController());

  @override
  void initState() {
    // TODO: implement initState
    _splashController.goToLoginPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: _width,
        color: DColors.blackCol,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              DImages.splash,
              height: 150.0,
              width: 150.0,
            ),
            SizedBox(height: 20,),
            Text(
              'Dogs Path',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: DColors.greyCol,
              ),
            ),
            SizedBox(height: 10,),
            Text('by',
              style: TextStyle(
                color: DColors.greyCol,
              ),),
            SizedBox(height: 10,),
            Text('VirtouStack Softwares Pvt. Ltd.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: DColors.greyCol,
              ),),
          ],
        ),
      ),
    );
  }
}
