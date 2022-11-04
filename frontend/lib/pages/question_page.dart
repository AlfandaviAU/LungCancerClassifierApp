// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/activity/question_activity.dart';
import 'package:frontend/pages/sum_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int usedIndex = 0;
  List qData = [
    {
      "qContent": "How old are you?",
      "qImage": "assets/images/age.png",
      "option1": "Female",
      "option2": "Male",
      "bgColor": Color(0xffF09816),
      "color1": Color(0xff227785),
      "color2": Colors.lightBlueAccent,
    },
    {
      "qContent": "What's your gender?",
      "qImage": "assets/images/gender.jpg",
      "option1": "Female",
      "option2": "Male",
      "bgColor": Colors.pinkAccent,
      "color1": Colors.pinkAccent,
      "color2": Colors.lightBlueAccent,
    },
    {
      "qContent": "Do you smoke?",
      "qImage": "assets/images/cigar.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xffEC5569),
      "color1": Colors.grey[800],
      "color2": Color(0xffEC5569),
    },
    {
      "qContent": "Any your fingers turn yellow?",
      "qImage": "assets/images/yellow_hand.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color.fromARGB(255, 255, 186, 59),
      "color1": Colors.grey[800],
      "color2": Color.fromARGB(255, 255, 186, 59),
    },
    {
      "qContent": "Do you feel anxious?",
      "qImage": "assets/images/anxious.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xffD86175),
      "color1": Colors.grey[800],
      "color2": Color(0xffD86175),
    },
    {
      "qContent": "Do you feel any peer pressure?",
      "qImage": "assets/images/peer_pressure.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xffFF725C),
      "color1": Colors.grey[800],
      "color2": Color(0xffFF725C),
    },
    {
      "qContent": "Do you have any chronic disease in the past?",
      "qImage": "assets/images/disease.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xff1D7BB7),
      "color1": Colors.grey[800],
      "color2": Color(0xff1D7BB7),
    },
    {
      "qContent": "Do you feel tired even doing nothing?",
      "qImage": "assets/images/tired.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xffE03269),
      "color1": Colors.grey[800],
      "color2": Color(0xffE03269),
    },
    {
      "qContent": "Do you have any allergy?",
      "qImage": "assets/images/allergy.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xff395961),
      "color1": Colors.grey[800],
      "color2": Color(0xffDA645A),
    },
    {
      "qContent": "Do you wheeze while breathing?",
      "qImage": "assets/images/wheezing.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xff395961),
      "color1": Colors.grey[800],
      "color2": Color(0xffDA645A),
    },
    {
      "qContent": "Do you consume alcohol by any chance?",
      "qImage": "assets/images/alcohol.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xff161684),
      "color1": Colors.grey[800],
      "color2": Color(0xffFF928F),
    },
    {
      "qContent": "Do your cough persist for several weeks?",
      "qImage": "assets/images/coughing.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xff6061A1),
      "color1": Colors.grey[800],
      "color2": Color(0xff6061A1),
    },
    {
      "qContent": "Do you feel shortness of breath while doing activity?",
      "qImage": "assets/images/hard_to_breath.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xffCF69D0),
      "color1": Colors.grey[800],
      "color2": Color(0xffCF69D0),
    },
    {
      "qContent": "Do you find it hard to swallow when you eat?",
      "qImage": "assets/images/hard_to_swallow.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xff3C5AC9),
      "color1": Colors.grey[800],
      "color2": Color(0xff3C5AC9),
    },
    {
      "qContent": "Do you feel any chest pain?",
      "qImage": "assets/images/heart.png",
      "option1": "Yes",
      "option2": "No",
      "bgColor": Color(0xffF49E18),
      "color1": Colors.grey[800],
      "color2": Color(0xffF49E18),
    },
  ];

  Map inputData = {
    "AGE": 60,
    "GENDER_F": false,
    "GENDER_M": true,
    "SMOKING_1": true,
    "SMOKING_2": false,
    "YELLOW_FINGERS_1": true,
    "YELLOW_FINGERS_2": false,
    "ANXIETY_1": true,
    "ANXIETY_2": false,
    "PEER_PRESSURE_1": true,
    "PEER_PRESSURE_2": false,
    "CHRONIC_DISEASE_1": true,
    "CHRONIC_DISEASE_2": false,
    "FATIGUE_1": true,
    "FATIGUE_2": false,
    "ALLERGY_1": true,
    "ALLERGY_2": false,
    "WHEEZING_1": true,
    "WHEEZING_2": false,
    "ALCOHOL_CONSUMING_1": true,
    "ALCOHOL_CONSUMING_2": false,
    "COUGHING_1": true,
    "COUGHING_2": false,
    "SHORTNESS_OF_BREATH_1": true,
    "SHORTNESS_OF_BREATH_2": false,
    "SWALLOWING_DIFFICULTY_1": false,
    "SWALLOWING_DIFFICULTY_2": false,
    "CHEST_PAIN_1": false,
    "CHEST_PAIN_2": false
  };

  @override
  Widget build(BuildContext context) {
    List keys = inputData.keys.toList();
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: QuestionActivity(
        qImage: qData[usedIndex]["qImage"],
        qContent: qData[usedIndex]["qContent"],
        option1: qData[usedIndex]["option1"],
        option2: qData[usedIndex]["option2"],
        bgColor: qData[usedIndex]["bgColor"],
        color1: qData[usedIndex]["color1"],
        color2: qData[usedIndex]["color2"],
        qNumber: usedIndex,
        function1: () {
          if (usedIndex == qData.length - 1) {
            // print("CALLED HERE?");
            Navigator.pushNamed(
              context,
              "/sum",
              arguments: {
                "inputData": inputData,
              },
            );
          } else {
            setState(() {
              // print(usedIndex);
              // var keys = (inputData[0].keys);
              // print(keys[(usedIndex * 2 - 1)]);
              inputData[keys[(usedIndex * 2 - 1)]] = !true;
              inputData[keys[(usedIndex * 2)]] = !false;
              // print(keys[(usedIndex * 2)]);
              // print(Type(inputData[0].keys));
              usedIndex = usedIndex + 1;
            });
          }
        },
        function2: () {
          if (usedIndex == qData.length - 1) {
            // print("CALLED HERE?");
            // Navigator.pushNamed(
            //   context,
            //   "/sum",
            // arguments: {
            //   "inputData": inputData,
            // },
            // );
            Navigator.of(context).push(_createRoute(inputData));
          } else {
            setState(() {
              inputData[keys[(usedIndex * 2 - 1)]] = !false;
              inputData[keys[(usedIndex * 2)]] = !true;
              usedIndex = usedIndex + 1;
              // print(inputData);
            });
          }
        },
        initNext: (age) {
          setState(() {
            age = age != "" ? age : 20;
            inputData["AGE"] = age;
            usedIndex = usedIndex + 1;
            // print(inputData);
          });
        },
      ),
    );
  }
}

Route _createRoute(inputData) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Summary(),
    settings: RouteSettings(
      arguments: {
        "inputData": inputData,
      },
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
