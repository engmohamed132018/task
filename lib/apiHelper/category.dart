import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/model/category_model.dart';

class ApiCategory {
  static Map<String, String> _headers = {'language': 'en'};
  static final Dio _dio = Dio();
  static Future<List<Category>> getCategory() async {
    List<Category> list = [];
    try {
      var response = await _dio.request(
        'https://mobileapi.tshtri.com/api/Category/GetMainCatWithAds',
        options: Options(
          method: 'GET',
          headers: _headers,
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonEncode(response.data);
        final result = jsonDecode(data);
        List finalData = result['data']['homeCategoryDto'];
        list = finalData.map((e) => Category.fromJson(e)).toList();
        return list;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return list;
  }
}
