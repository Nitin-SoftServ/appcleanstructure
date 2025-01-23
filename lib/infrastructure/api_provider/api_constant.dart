import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiConstant {
  var baseUrl ="https://jsonplaceholder.typicode.com/posts";


 //auth
  var createUser ="/api/user/createuser";
  var exGet= "/1";

  var login ="/api/user/login";
  var profile="/api/user/profile";


  var tag = 'api_provider';







  handleException(error, stacktrace, DioError dioError) {
    debugPrint("Exception occurred: $error stackTrace: $stacktrace");
    if (_checkSocketException(dioError)) {
      throwIfNoSuccess('no_internet_connection'.tr);
    } else if (dioError.response!.statusCode == 400) {
      //throwIfNoSuccess("invalid_request".tr);
      throwIfNoSuccess(dioError.response!.data['message']);
    } else if (dioError.response!.statusCode == 500) {
      throwIfNoSuccess("server_error".tr);
    } else {
      if (dioError.response!.data == null) {
        throwIfNoSuccess("something_went_wrong".tr);
      } else {
        throwIfNoSuccess(dioError.response!.data['message']);
      }
    }
  }
}

void throwIfNoSuccess(String response) {
  throw HttpException(response);
}

bool _checkSocketException(DioError err) {
  return err.type == DioErrorType.unknown && err.error != null && err.error is SocketException;
}
