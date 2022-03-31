import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            Text(
               'Please check your internet connection..',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,

            ),
          ],
        ),
      ),
    );
  }
}