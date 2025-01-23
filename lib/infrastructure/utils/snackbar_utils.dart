

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static void showSuccess({required String message,Color? color}) {
    Get.rawSnackbar(
      title: 'Success',
      message: message,
      backgroundColor:color??Colors.green.shade600,
    );
  }

  static void showWarning({required String message}) {
    Get.rawSnackbar(
      title: 'Warning',
      message: message,
      backgroundColor: Colors.orange.shade900,
    );
  }

  static void showError({required String message}) {
    Get.rawSnackbar(
      title: 'Error',
      message: message,
      backgroundColor: Colors.redAccent.shade700,
    );
  }



}
