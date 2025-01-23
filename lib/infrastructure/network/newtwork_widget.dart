
import 'dart:developer';

import 'package:appstructureapp/infrastructure/network/network_helper.dart';
import 'package:appstructureapp/styles/colors.dart';
import 'package:appstructureapp/styles/sizes.dart';
import 'package:appstructureapp/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget networkWidget(Widget widget, BuildContext context) {
  ConnectivityController networkManager = Get.put(ConnectivityController());
  return GetBuilder<ConnectivityController>(builder: (builder) {
    log("Connection Type : ${networkManager.connectionType}");
    return Stack(
      children: [
        widget,
        networkManager.connectionType == 0
            ? noInternetToast()
            : const SizedBox.shrink()
      ],
    );
  });
}
Widget noInternetToast() {
  return Container(
      padding: const EdgeInsets.all(.5),
      color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.wifi_off_outlined,
          ),
        const SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child:Text("Cannot connect, please reconnect to your mobile network or wifi",
            style: regularTextStyle(fontSize: dimen13, color: AppColors.colWhite),
            )

          ),
        ],
      ));
}
