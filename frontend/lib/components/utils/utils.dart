// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

WidgetSpan addPaddingSpan(double amount) {
  return WidgetSpan(
    child: Container(
      padding: EdgeInsets.all(amount),
    ),
  );
}

Positioned CardBackgroundDarker(Size size) {
  return Positioned.fill(
    // top: 100,
    child: Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * 0.425,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    ),
  );
}

Positioned CardBackgroundCurly(Size size) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    top: size.height * 0.5,
    child: Container(
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    ),
  );
}
