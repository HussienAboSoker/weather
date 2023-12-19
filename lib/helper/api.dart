import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  Future<dynamic> get({required path}) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        path,
      );

      return response.data;
    } on DioException catch (e) {
      e.message;
    }catch(e){
      log(e.toString());
      throw Exception("oop try later");
    }
  }
}
