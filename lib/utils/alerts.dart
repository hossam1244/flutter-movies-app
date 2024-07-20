

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class Alerts  {
  static void showAlertDialog(String title, String message) {
    BuildContext? context = Get.key.currentContext;
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        );
      }
    );
  }
}