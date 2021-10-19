import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';

class HttpService{
  Dio _dio = Dio();
  // /v1/public/characters
  final baseUrl = "https://gateway.marvel.com";

  HttpService(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }


  Future<Response> getRequest({required String endPoint, int? offset}) async{
    Response response;
    String timeStamp = DateTime.now().toIso8601String();
    String apiKey = '9e12cab90927d9d68dc623a6cf79f6f2';
    String privateApiKey = '4994760990560cbf168ff569cf6942b52b076ce9';
    String md5hash = md5.convert(utf8.encode(timeStamp+privateApiKey+apiKey)).toString();
    offset ??= 0;

    try {
      response = await _dio.get(
          endPoint +
              '?apikey=' + apiKey +
              '&ts=' + timeStamp +
              '&hash=' + md5hash +
              '&offset=' + offset.toString() +
              '&limit=' + '20'
      );
    } on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }

    return response;

  }


  initializeInterceptors(){

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          log('Request on interceptor: ' + options.path.toString());
          return handler.next(options);
        },
        onResponse:(response, handler) {
          log('Response on interceptor: ' + response.data.toString());
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          log('Error on interceptor: ' + error.message.toString() + ' - ' + error.response!.data.toString());
          return  handler.next(error);
        }
    ));

  }
}