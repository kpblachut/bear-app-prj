import 'package:flutter/material.dart';


class CustomTextFieldWithoutBorder extends StatelessWidget {
  const CustomTextFieldWithoutBorder({
    Key key,
    @required this.hintText,
    @required this.fontSize,
  }) : super(key: key);

  final String hintText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
        hintText: hintText
      ),
    );
  }
}

class CustomTextFieldBrighterBg extends StatelessWidget {
  const CustomTextFieldBrighterBg({
    Key key,
    this.hintText,
    @required this.fontSize,
  }) : super(key: key);

  final String hintText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      padding: EdgeInsets.all(4.0),
      child: TextField(
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[600],
          border: InputBorder.none,
          hintText: hintText
        ),
      ),
    );
  }
}