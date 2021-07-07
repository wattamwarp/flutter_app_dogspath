import 'dart:convert';

import 'package:flutter_app_dogspath/constants/constants.dart';
import 'package:flutter_app_dogspath/model/photos_data.dart';
import 'package:http/http.dart' as http;

class GetDataService{

  static var client = http.Client();

  Future<List<PhotosData>> getData() async {
    Uri uri = Uri.parse(Urls.mainUrl);

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var data = photosDataFromJson(response.body.toString());
      print(data[1].title);
      List<PhotosData> list = data;
      return list;
    } else {
      return [];
    }
  }

}