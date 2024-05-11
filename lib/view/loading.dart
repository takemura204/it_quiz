// Flutter imports:
import 'package:flutter/material.dart';

class OverLayLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.6),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
        ],
      ),
    );
  }
}
