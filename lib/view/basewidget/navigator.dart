import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

getAnotherPage(context ,Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}

getPageBack(context,){
  Navigator.pop(context);
}