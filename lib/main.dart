import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miteshapinews/dashscreen/dataui.dart';
void main(){
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: DataUi(),
      ),
  );
}