// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/components/button_collections.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/components/utils/utils.dart';
import 'package:frontend/components/question_cards.dart';
import 'package:frontend/components/card_backgrounds.dart';
import 'package:frontend/components/button_age.dart';
// import 'package:frontend/components/home_app_bar.dart';

class QuestionActivity extends StatefulWidget {
  const QuestionActivity({
    Key? key,
    required this.qImage,
    required this.qContent,
    required this.option1,
    required this.option2,
    required this.bgColor,
    required this.color1,
    required this.color2,
    required this.qNumber,
    required this.function1,
    required this.function2,
    required this.initNext,
  }) : super(key: key);

  final String qImage, qContent, option1, option2;
  final Color bgColor, color1, color2;
  final int qNumber;
  final VoidCallback function1, function2;
  final Function initNext;

  @override
  State<QuestionActivity> createState() => _QuestionActivityState();
}

class _QuestionActivityState extends State<QuestionActivity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CardBackground(
            bgColor: widget.bgColor,
          ),
          CardBackgroundCurly(size),
          CardBackgroundDarker(size),
          QuestionCard(
            qImage: widget.qImage,
            qNumber: widget.qNumber,
            qContent: widget.qContent,
          ),
          // print(widget.qNumber),
          // Positioned(
          //   top: 100,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Text(
          //       "${widget.qNumber + 1}",
          //       style: Theme.of(context).textTheme.titleLarge,
          //     ),
          //   ),
          //   // child: Text("${widget.qNumber}"),
          // ),
          if (widget.qNumber != 0) ...[
            button_collections(
              option1: widget.option1,
              option2: widget.option2,
              color1: widget.color1,
              color2: widget.color2,
              function1: widget.function1,
              function2: widget.function2,
            )
          ] else ...[
            button_age(widget: widget)
          ]
        ],
      ),
    );
  }
}
