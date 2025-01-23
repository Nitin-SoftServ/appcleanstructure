import 'dart:convert';

import 'package:appstructureapp/infrastructure/api_provider/dioLogger.dart';
import 'package:appstructureapp/infrastructure/app_constant/app_constant.dart';
import 'package:appstructureapp/infrastructure/models/example_model.dart';
import 'package:appstructureapp/infrastructure/models/user_model.dart';
import 'package:appstructureapp/infrastructure/storage/pref_manager.dart';
import 'package:dio/dio.dart';

import 'api_constant.dart';

class ApiProvider {
  Dio _dio = Dio();

  var apiEndPoints = ApiConstant();
  DioException? _dioError;


  ApiProvider.base() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = ApiConstant().baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {'Content-Type': 'application/json'};
      DioLogger.onSend(ApiConstant().tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(ApiConstant().tag, response);
      return handler.next(response);
    }, onError: (DioException error, handler) {
      _dioError = error;
      DioLogger.onError(ApiConstant().tag, error);
      return handler.next(error);
    }));
  }

  ApiProvider.baseWithToken() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = ApiConstant().baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      String accessToken = await PrefManager.getString(AppConstants.accessToken);

      options.headers = {'Content-Type': 'application/json'};
      options.headers = {'Authorization': 'Bearer $accessToken'};
      DioLogger.onSend(ApiConstant().tag, options);
      print("accessToken${options.headers}");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(ApiConstant().tag, response);
      return handler.next(response);
    }, onError: (DioException error, handler) {
       logOutUser();
      _dioError = error;
      DioLogger.onError(ApiConstant().tag, error);
      return handler.next(error);
    }));
  }


/// Example For Api Calling

  Future getExampleApiFunc()async{
    try{
      Response res =  await _dio.get(apiEndPoints.baseUrl+apiEndPoints.exGet);
      return ExampleModel.fromJson(res.data);
    }on DioException catch(e){
      print('Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  Future postExampleApiFunc(params)async{
    try {
      var data = json.encode(params);
      print('checkparams>>$data');
      print(ApiConstant().baseUrl+ApiConstant().login);
      Response response = await _dio.post(apiEndPoints.baseUrl, data: data);
      return ExampleModel.fromJson(response.data);
    } catch (error, stacktrace) {
      apiEndPoints.handleException(error, stacktrace, _dioError!);
    }
  }


  ///creatUser Api
  Future createUserApiFunc(params) async {
    try {
      var data = json.encode(params);
      print('checkparams>>$data');
      Response response = await _dio.post(apiEndPoints.baseUrl+apiEndPoints.createUser, data: data );
      return UserModel.fromJson(response.data);
    } catch (error, stacktrace) {
      apiEndPoints.handleException(error, stacktrace, _dioError!);
    }
  }


  Future getProfileApiFunc() async {
    try {

      Response response = await _dio.get(apiEndPoints.baseUrl+apiEndPoints.profile);
      print("profile>>>${response}");
      return UserModel.fromJson(response.data);

    }  on DioException catch (e) {
      logOutUser();
      print('Error: ${e.response?.data ?? e.message}');
      throw e;
    }
  }
  logOutUser()async{
    // PrefManager.remove(AppConstants.loggedIn);
    // PrefManager.remove(AppConstants.accessToken);
    // Get.offAllNamed(Routes.authScreen);
  }

}
