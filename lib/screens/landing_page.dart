import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_dogspath/constants/constants.dart';
import 'package:flutter_app_dogspath/controller/landing_controller.dart';
import 'package:flutter_app_dogspath/helper/helper.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LandingController _landingController = Get.put(LandingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final _height = sizeConfig.safeHeight;
    final _width = sizeConfig.safeWidth;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height * 100,
          width: _width * 100,
          color: DColors.greyCol,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Dogs Path',
                style: TextStyle(
                  color: DColors.lightGreyTextCol,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              card(),
            ],
          ),
        ),
      ),
    );
  }

  Widget card() {
    final _height = sizeConfig.safeHeight;
    print("the heigth is " + _height.toString());
    return Obx(
      () {
        return Container(
          height: _height * 100 - 36,
          color: DColors.greyCol,
          child: _landingController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: 15, //_landingController.dataList.length,
                  itemBuilder: (context, mainIndex) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 4),
                                      child: Text(
                                        _landingController
                                            .dataList[mainIndex].title,
                                        style: TextStyle(
                                            color: DColors.greyTextCol,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        _landingController.dataList[mainIndex]
                                                .subPaths.length
                                                .toString() +
                                            " Sub paths",
                                        style: TextStyle(
                                          color: DColors.lightGreyTextCol,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: DColors.blackBtnCol,
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 4, bottom: 4),
                                margin: EdgeInsets.only(right: 8),
                                child: Text(
                                  'Open Path',
                                  style: TextStyle(
                                    color: DColors.greyTextCol,
                                    fontSize: 14,
                                    //    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          elevation: 6,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                color: DColors.greyCol,
                                child: Swiper(
                                  autoplay: false,
                                  loop: false,
                                  onIndexChanged: (int index) {
                                    _landingController.controllerList[mainIndex]
                                        .move(index);
                                    _landingController.currentIndex.value =
                                        index;
                                  },
                                  itemBuilder:
                                      (BuildContext context, int subIndex) {
                                    return Image.network(
                                      _landingController.dataList[mainIndex]
                                          .subPaths[subIndex].image,
                                      fit: BoxFit.fill,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace stackTrace) {
                                        return Center(
                                            child: Text('No data Found'));
                                      },
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    );
                                  },
                                  itemCount: _landingController
                                          .dataList[mainIndex]
                                          .subPaths
                                          .length ??
                                      0,
                                  controller: _landingController
                                      .controllerList[mainIndex],
                                ),
                              ),
                              Container(
                                height: 40,
                                color: DColors.blackBtnCol,
                                child: Swiper(
                                  autoplay: false,
                                  loop: false,
                                  viewportFraction: 0.3,
                                  //scale: 0.3,
                                  itemBuilder:
                                      (BuildContext context, int subIndex) {
                                    return InkWell(
                                      onTap: () {
                                        _landingController
                                            .controllerList[mainIndex]
                                            .move(subIndex);
                                      },
                                      child: Center(
                                        child: Text(
                                          _landingController.dataList[mainIndex]
                                              .subPaths[subIndex].title,
                                          style: TextStyle(
                                              color: _landingController
                                                          .currentIndex ==
                                                      subIndex
                                                  ? DColors.greyTextCol
                                                  : DColors.lightGreyTextCol),
                                        ),
                                      ),
                                    );
                                  },
                                  onIndexChanged: (int index) {
                                    _landingController.currentIndex.value =
                                        index;
                                    // print("the changed index is"+index.toString());
                                  },
                                  itemCount: _landingController
                                      .dataList[mainIndex].subPaths.length,
                                  controller: _landingController
                                      .controllerList[mainIndex],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
