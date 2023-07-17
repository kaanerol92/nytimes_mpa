import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Helper {
  static int getDiff(DateTime dateTime) {
    return DateTime.now().difference(dateTime).inMilliseconds;
  }

  static showNotification(dynamic content) {
    showSimpleNotification(content, position: NotificationPosition.bottom);
  }

  static OverlaySupportEntry showLoading() {
    return showOverlay(
      (context, progress) {
        return const Material(
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(color: Colors.white),
              SizedBox(
                height: 10,
              ),
              Text(
                "...Loading...",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
      duration: Duration.zero,
    );
  }
}
