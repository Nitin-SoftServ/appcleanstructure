import 'dart:io';
import 'package:appstructureapp/infrastructure/network/newtwork_widget.dart';
import 'package:appstructureapp/screens/home_controller.dart';
import 'package:appstructureapp/styles/colors.dart';
import 'package:appstructureapp/styles/sizes.dart';
import 'package:appstructureapp/styles/styles.dart';
import 'package:appstructureapp/theme/buttom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pinkLight,
      ),
        body: Obx(
              () => networkWidget(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Get Request",
                        style: regularTextStyle(fontSize: dimen16, color: AppColors.black),
                      ),
                      const SizedBox(
                          height:20
                      ),
                      Text(
                        controller.title.value,
                        style: boldTextStyle(fontSize: dimen16, color: AppColors.black),
                      ),
                      Text(
                        controller.des.value,
                        style:
                        mediumTextStyle(fontSize: dimen13, color: AppColors.blueGrey),
                      ),
                      const SizedBox(
                          height:20
                      ),
                      GestureDetector(
                          onTap: (){
                            controller.postApiEx();
                          },
                          child:
                          buttonWidget(text: "Post Request" ,textColor: AppColors.colWhite,color: AppColors.pinkDark))
                    ],
                  ),
                  context
              ),
        ));
  }
}
