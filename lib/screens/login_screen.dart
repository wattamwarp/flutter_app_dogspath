import 'package:flutter/material.dart';
import 'package:flutter_app_dogspath/constants/constants.dart';
import 'package:flutter_app_dogspath/controller/login_controller.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _heigth = MediaQuery.of(context).size.height;
    return Scaffold(body: Container(
      child:
      // Obx(() {
      //   return

          Container(
          color: DColors.blackCol,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: DColors.greyTextCol,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sign in with your facebook account',
                style: TextStyle(
                  color: DColors.greyTextCol,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  // final LoginResult result = await FacebookAuth.instance.login();
                  // if (result.status == LoginStatus.success) {
                  //   final AccessToken accessToken = result.accessToken!;
                  //   print(accessToken);
                  //   print(result.message);
                  // }
                  // print(result.message.toString());
                  // print(result.status);
                  // print(result.accessToken.toString());
                  _loginController.login(context);
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    height: 50,
                    width: _width,
                    color: DColors.blebtnCol,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'sign In with Facebook',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        //;


      //}),

    ));
  }
}
