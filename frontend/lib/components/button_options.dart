import 'package:flutter/material.dart';

class buttonOptions extends StatelessWidget {
  const buttonOptions({
    Key? key,
    required this.option1,
    required this.option2,
    required this.function1,
    required this.function2,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final String option1, option2;
  final Color color1, color2;
  final VoidCallback function1, function2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: function1,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            backgroundColor: color1,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Text(
            option1,
            style: Theme.of(context).textTheme.button?.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: function2,
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            backgroundColor: color2,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Text(
            option2,
            style: Theme.of(context).textTheme.button?.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
