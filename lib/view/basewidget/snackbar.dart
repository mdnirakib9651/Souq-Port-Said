import 'package:flutter/material.dart';
import '../../utill/color_resources.dart';
import '../../utill/style/ubuntu.dart';

snackBar (String msg){
  return SnackBar(
    content:  Text(msg, style: ubuntuRegular.copyWith(color: ColorResources.white, fontSize: 16),),
    backgroundColor: ColorResources.black,
  );
}
