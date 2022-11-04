import 'package:flutter/material.dart';
import 'package:frontend/pages/question_page.dart';
import 'package:frontend/pages/sum_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/questions",
        routes: {
          // "/": (context) => HomePage(),
          "/sum": (context) => Summary(),
          "/questions": (context) => QuestionPage(),
          // "/home": (context) => HomePage(),
          // "/location": (context) => ChooseLocation(),
        },
      ),
    );
