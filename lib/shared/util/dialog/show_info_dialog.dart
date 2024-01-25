import 'package:flutter_animate/flutter_animate.dart';
import 'package:presensi/core.dart';
import 'package:flutter/material.dart';

Future showInfoDialog({
  required String message,
  required String title,
  Icon? icon,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Card(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        icon ??
                            const Icon(
                              Icons.info,
                              size: 40.0,
                              color: Colors.amber,
                            ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () => Get.back(),
                          child: Text(
                            "Oke",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade().shake(),
        ),
      );
    },
  );
}
