import 'package:flutter/material.dart';
import 'utils/utils.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.qContent,
    required this.qNumber,
    required this.qImage,
  }) : super(key: key);

  final String qContent, qImage;
  final int qNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned.fill(
      // top: 100,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.9,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Image.asset(
                            qImage,
                            width: size.width * 0.4,
                            height: size.height * 0.2,
                          ),
                        ),
                        addPaddingSpan(6),
                        TextSpan(
                          text: "\nquestion ${qNumber + 1}".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(),
                        ),
                        addPaddingSpan(6),
                        TextSpan(
                          text: "\n$qContent",
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
