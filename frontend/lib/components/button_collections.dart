import 'package:flutter/material.dart';
import 'button_options.dart';

class button_collections extends StatelessWidget {
  const button_collections({
    Key? key,
    required this.option1,
    required this.option2,
    required this.color1,
    required this.color2,
    required this.function1,
    required this.function2,
  }) : super(key: key);

  final String option1, option2;
  final Color color1, color2;
  final VoidCallback function1, function2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned.fill(
      // top: 100,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.8,
          decoration: const BoxDecoration(
            // color: Colors.blue[200],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: buttonOptions(
            option1: option1,
            color1: color1,
            option2: option2,
            color2: color2,
            function1: function1,
            function2: function2,
          ),
        ),
      ),
    );
  }
}
