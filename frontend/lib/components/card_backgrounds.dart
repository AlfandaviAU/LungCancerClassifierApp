import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      // child: const Text("Hello"),
    );
  }
}
