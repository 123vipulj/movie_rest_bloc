import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  String titleTxt;

  TitleName(this.titleTxt);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0),
      child: Text(
        titleTxt,
        style: TextStyle(fontSize: 30, color: Color(0xff051938),fontWeight: FontWeight.w900),
      ),
    );
  }
}
