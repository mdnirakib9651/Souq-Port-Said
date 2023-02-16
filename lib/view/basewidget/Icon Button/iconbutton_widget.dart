// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function onTab;
  String image;

  IconButtonWidget({Key? key, required this.image, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => onTab()));
        },
        icon: Image.asset(image, height: 22, width: 23,));
  }
}
