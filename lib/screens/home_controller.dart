import 'dart:developer';
import 'dart:io';

import 'package:appstructureapp/infrastructure/api_provider/api_provider.dart';
import 'package:appstructureapp/infrastructure/models/example_model.dart';
import 'package:appstructureapp/infrastructure/utils/progress_dailog.dart';
import 'package:appstructureapp/infrastructure/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
 var title = "".obs;
 var des = "".obs;

 ProgressDialog progressDialog = ProgressDialog();


 @override
 void onInit() {
   super.onInit();
   WidgetsBinding.instance.addPostFrameCallback((_) {
     getApiEx();
   });


 }

 //ex:- get api
 getApiEx()async{
    progressDialog.show();
   try{
     ExampleModel exampleModel = await ApiProvider.base().getExampleApiFunc();
     if(exampleModel.id !=null){
     title.value = exampleModel.title??"";
     des.value = exampleModel.body??"";
     progressDialog.dismiss();

     }
   }on HttpException catch(e){
     progressDialog.dismiss();
     print(e);
   }
   catch(e){
     progressDialog.dismiss();
     print(e);
   }
  }

  //ex:- post api

  postApiEx()async{
    progressDialog.show();
    try{
      var postEx ={
          "title": "foo",
          "body": "bar",
          "userId": 1
      };
      ExampleModel exampleModel = await ApiProvider.base().postExampleApiFunc(postEx);
      if(exampleModel.id !=null){
        progressDialog.dismiss();
        SnackBarUtil.showSuccess(message: "Post API Worked!!!!!!!!!!!");
      }
    }on HttpException catch (e){
      print(e.message.toString());
      progressDialog.dismiss();

    }catch (e){
      log(e.toString());
      progressDialog.dismiss();

    }
  }



}