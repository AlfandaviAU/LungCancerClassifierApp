import 'package:flutter/material.dart';
import 'package:frontend/activity/question_activity.dart';

class button_age extends StatefulWidget {
  const button_age({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final QuestionActivity widget;

  @override
  State<button_age> createState() => _button_ageState();
}

class _button_ageState extends State<button_age> {
  String ageInput = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.7,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        width: size.width,
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(16),
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.center,
            // color: Colors.green,
            height: size.height * 0.1,
            width: size.width * 0.35,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  ageInput = value;
                });
              },
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Age",

                // hintStyle: TextStyle(
                //   color: colors.withOpacity(0.5),
                // ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              widget.widget.initNext(ageInput);
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              backgroundColor: widget.widget.color1,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.height * 0.04 as double),
            ),
            child: Text(
              "Submit",
              style: Theme.of(context).textTheme.button?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ]),
      ),
    );
  }
}
