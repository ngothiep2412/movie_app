import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/my_colors.dart';
import 'package:movie_app/core/utils/primary_font.dart';

class DialogUtils {
  static Future<void> showMyDialog(
      {required BuildContext context,
      required String title,
      required String content}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kPrimaryBackgroundColor,
          title: Text(
            title,
            style: PrimaryFont.bold(16).copyWith(
              color: Colors.red,
            ),
          ),
          content: Text(
            content,
            style: PrimaryFont.regular(16).copyWith(
              color: Colors.red,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Đóng",
                style: PrimaryFont.regular(16).copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
