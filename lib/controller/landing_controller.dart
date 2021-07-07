

import 'package:flutter_app_dogspath/model/photos_data.dart';
import 'package:flutter_app_dogspath/services/get_data_service.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class LandingController extends GetxController{
  var dataList = List<PhotosData>().obs;
  var a = 0.obs;
  var isLoading = true.obs;
  var controllerList= List<SwiperController>().obs;
  var currentIndex= 1.obs;

  GetDataService _getDataService= new GetDataService();

  @override
  void onInit() {

    super.onInit();
    fetchData();
  }

  makeControllers(int length){
   for(int i=0;i<length;i++){
     controllerList.add(new SwiperController());
   }
  }

  fetchData() async {
    try {
      isLoading(true);
      var list = await _getDataService.getData();
      if (list != null) {
        dataList.value = list;
      }
    } finally {
      isLoading(false);
    }
    makeControllers(dataList.length);
  }



}