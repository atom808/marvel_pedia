import 'dart:developer';

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


  Future<Response> getRequest({required String endPoint}) async{
    Response response;

    try {
      response = await _dio.get(endPoint + '&apikey=' + '9e12cab90927d9d68dc623a6cf79f6f2');
    } on DioError catch (e) {
      log(e.message);
      throw Exception(e.message);
    }

    return response;

  }


  initializeInterceptors(){

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          // Do something before request is sent
          log('Request on interceptor: ' + options.path.toString());
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onResponse:(response, handler) {
          // Do something with response data
          log('Response on interceptor: ' + response.data.toString());
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onError: (DioError error, handler) {
          // Do something with response error
          log('Error on interceptor: ' + error.message.toString());
          return  handler.next(error);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        }
    ));

  }
}