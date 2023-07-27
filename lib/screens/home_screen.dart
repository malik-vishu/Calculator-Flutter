import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/home_rows.dart';
import '../components/themes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = '';
  String output = '';

  bool inputHide = false;
  double outputSize = 42;
  onClick(value) {
    if (value == "X") {
      value = "*";
    }
    if (value == "C") {
      input = '';
      output = '';
    } else if (value == '<' && !input.isEmptyOrNull) {
      input = input.substring(0, input.length - 1);
    } else if (value == '=') {
      if (input.isNotEmpty) {
        Parser parser = Parser();
        Expression exp = parser.parse(input);
        ContextModel model = ContextModel();
        double ans = exp.evaluate(EvaluationType.REAL, model);
        output = ans.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        if (output == '0') {
          output = '';
        }
        input = output;
        inputHide = true;
        outputSize = 48;
      }
    } else {
      if (value != '<') {
        input = input + value;
        inputHide = false;
        outputSize = 42;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: homeGrayColor,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    inputHide
                        ? ''.text.make()
                        : input.text.color(Colors.white70).size(48).make(),
                    const SizedBox(
                      height: 20,
                    ),
                    output.text.color(Colors.white54).size(outputSize).make(),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: homeBlueColor,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VStack(
                      alignment: MainAxisAlignment.center,
                      crossAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: HorizontalRowsHome(
                                textButtonStyle: textButtonStyle1,
                                symbol: const ["AC", "%", "<", "/"],
                                onClick: onClick),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: HorizontalRowsHome(
                                textButtonStyle: textButtonStyle1,
                                symbol: const ["7", "8", "9", "X"],
                                onClick: onClick),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: HorizontalRowsHome(
                                textButtonStyle: textButtonStyle1,
                                symbol: const ["4", "5", "6", "-"],
                                onClick: onClick),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: HorizontalRowsHome(
                                textButtonStyle: textButtonStyle1,
                                symbol: const ["1", "2", "3", "+"],
                                onClick: onClick),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 75,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: HorizontalRowsHome(
                                      textButtonStyle: textButtonStyle1,
                                      symbol: const ["0", "."],
                                      itemCount: 2,
                                      onClick: onClick),
                                ).expand(),
                                TextButton(
                                  style: textButtonStyle2.copyWith(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromARGB(
                                                  189, 51, 140, 224))),
                                  onPressed: () => onClick("="),
                                  child: "=".text.size(42).gray900.make(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
