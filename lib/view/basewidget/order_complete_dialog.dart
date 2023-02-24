import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

orderCompleteDialog(BuildContext context){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:const Text("Order Complete"),
        content:const Text("Congratulations! Your order has been successfully placed."),
        actions: <Widget>[
          TextButton(
            child:const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}