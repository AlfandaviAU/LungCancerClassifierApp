import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/card_backgrounds.dart';
import 'package:frontend/components/utils/utils.dart';

import 'package:http/http.dart' as http;

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool condSum = false;
  bool condProcess = false;
  List stateData = [
    {
      "text": "Yes, You're Healthy! 😇",
      "image": "assets/images/healthy.png",
      "color": const Color(0xff3C5AC9),
    },
    {
      "text": "You Have Lung Cancer! 🤒",
      "image": "assets/images/sick.png",
      "color": const Color(0xffFF4B58),
    }
  ];

  void fetchData() async {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    // print("inputData");
    // print(arguments);
    final data = await (arguments["inputData"])!;
    var url = Uri.parse("http://127.0.0.1:5000/predict");
    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    var res = (json.decode(response.body));

    setState(() {
      condSum = res["response"] == "YES";
      condProcess = true;
    });
    // print(data);
    // print(res);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Color usedColor = Colors.white;
    // if (condSum) {
    //   usedColor = stateData["true"]["Color"];
    // } else {
    //   usedColor = stateData["false"]["Color"];
    // }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // child: Container(
        //   child: Text(data.toString()),
        // ),
        child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                CardBackground(
                  bgColor: condProcess == true
                      ? stateData[condSum == true ? 1 : 0]["color"]
                      : Color(0xff00E0C0),
                ),
                CardBackgroundCurly(size),
                Positioned.fill(
                  // top: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: size.height * 0.8,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  // top: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: size.height * 0.75,
                      width: size.width * 0.9,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: size.height * 0.45,
                              decoration: const BoxDecoration(
                                  // color: Colors.red[100],
                                  ),
                              alignment: Alignment.center,
                              child: Container(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: size.width * 0.8,
                                      height: size.height * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(60)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            condProcess
                                                ? stateData[condSum == true
                                                    ? 1
                                                    : 0]["image"]
                                                : "assets/images/processing.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            height: size.height * 0.1,
                            alignment: Alignment.center,
                            // color: Colors.red,
                            // padding: EdgeInsets.all(30),
                            margin: EdgeInsets.only(left: size.width * 0.05),
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: condProcess
                                              ? stateData[condSum == true
                                                  ? 1
                                                  : 0]["text"]
                                              : "Processing",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // top: 20,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 6,
                                    color: condProcess
                                        ? stateData[condSum == true ? 1 : 0]
                                            ["color"]
                                        : Color(0xff00E0C0).withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
