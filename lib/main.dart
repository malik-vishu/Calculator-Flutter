import 'package:calculator/screens/calc_type_screen.dart';
import 'package:calculator/screens/conversion_screen.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:calculator/screens/page_view.dart';
import 'package:calculator/utils/all_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        initialRoute: AllRoutes.pageview,
        routes: {
          AllRoutes.home: (context) => HomeScreen(),
          AllRoutes.options: (context) => const CalculatorOptionsScreen(),
          AllRoutes.conversion: (context) => ConversionScreen(conversionType: "Length"),
          AllRoutes.pageview:(context) => PageViewWidget()
        });
  }
}
