import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/styles.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    leading: const Icon(Icons.arrow_back,color: Colors.black,),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: Text(title,textAlign: TextAlign.center,
      style: Styles.style25,),
  );
}