import 'package:calculator/components/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CalculatorOptionsScreen extends StatelessWidget {
  const CalculatorOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: context.screenWidth,
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: homeGrayColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: HorizontalRowsOptions(
                    textButtonStyle: textButtonStyle3,
                    symbol: const ["Area", "BMI", "Data"],
                    icon: const [
                      CupertinoIcons.arrow_down_right_arrow_up_left,
                      CupertinoIcons.equal,
                      CupertinoIcons.graph_square
                    ],
                  ),
                ),
                HorizontalRowsOptions(
                  textButtonStyle: textButtonStyle3,
                  symbol: const ["Length", "Mass", "Temperature"],
                  icon: const [
                    CupertinoIcons.arrow_left_right_square,
                    Icons.monitor_weight_outlined,
                    CupertinoIcons.thermometer
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalRowsOptions extends StatelessWidget {
  HorizontalRowsOptions(
      {super.key,
      required this.textButtonStyle,
      required this.symbol,
      this.itemCount = 3,
      this.onClick,
      required this.icon});

  final List<String> symbol;
  final ButtonStyle textButtonStyle;
  final int itemCount;
  Function(dynamic value)? onClick;
  final List<IconData> icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextButton(
                style: textButtonStyle,
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(
                      icon[index],
                      size: 50,
                      color: const Color.fromARGB(255, 120, 184, 240),
                    ),
                    symbol[index]
                        .text
                        .size(20)
                        .color(const Color.fromARGB(255, 120, 184, 240))
                        .make(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
