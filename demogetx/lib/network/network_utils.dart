import 'dart:io';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

import 'key.dart';

class NetworkUtils{
  static String baseUrl ="https://api.doge-meme.lol/";
  static Future<Dio> getDioClient() async {
    String token = KeyResource.tokenKey;
    Dio? dio;
    if (dio == null) {
      dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/json",
          headers: <String, dynamic>{
            "Authorization": "Bearer $token",
          }));
      dio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
            compact: true),
      );
    }
    return dio;
  }

  static Future<bool> hasConnection() async {
    try {
      final List<InternetAddress> result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }
}