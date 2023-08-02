import 'package:calculator/screens/calc_type_screen.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
 PageViewWidget({super.key});

    final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children:  <Widget>[
        HomeScreen(),
        const CalculatorOptionsScreen(),
        
      ],
    );
  }
}
