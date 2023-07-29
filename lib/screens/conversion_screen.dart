import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/home_rows.dart';
import '../components/themes.dart';

List<String> typeList = ["one", "two"];

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({super.key});

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  String dropdownValue = typeList.first;
  String dropdownValue2 = typeList.first;
  TextEditingController controllerVar1 = TextEditingController();
  TextEditingController controllerVar2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: homeGrayColor,
          ),
        ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: DropdownButton<String>(
                              alignment: Alignment.bottomCenter,
                              isExpanded: true,
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward,
                                  size: 25,
                                  color: Color.fromARGB(255, 214, 221, 221)),
                              elevation: 10,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 214, 221, 221),
                                  fontSize: 28),
                              underline: Container(
                                height: 2,
                                color: const Color.fromARGB(255, 214, 221, 221),
                              ),
                              dropdownColor: Colors.black12,
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: typeList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 280,
                              child: TextFormField(
                                controller: controllerVar1,
                                cursorColor:
                                    const Color.fromARGB(255, 214, 221, 221),
                                cursorWidth: 4,
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 214, 221, 221)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 233, 101, 48)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 14, 15)),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 214, 221, 221)),
                                    hintText: "Enter value to convert",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 3))),
                                keyboardType: TextInputType.none,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: DropdownButton<String>(
                              alignment: Alignment.bottomCenter,
                              dropdownColor: Colors.black12,
                              value: dropdownValue2,
                              icon: const Icon(
                                Icons.arrow_downward,
                                size: 25,
                                color: Color.fromARGB(255, 214, 221, 221),
                              ),
                              elevation: 10,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 214, 221, 221),
                                  fontSize: 28),
                              isExpanded: true,
                              underline: Container(
                                height: 2,
                                color: const Color.fromARGB(255, 214, 221, 221),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue2 = value!;
                                });
                              },
                              items: typeList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 280,
                              child: TextFormField(
                                controller: controllerVar2,
                                cursorColor:
                                    const Color.fromARGB(255, 214, 221, 221),
                                cursorWidth: 4,
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 214, 221, 221)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 233, 101, 48)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 14, 15)),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 214, 221, 221)),
                                    hintText: "Enter value to convert",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 3))),
                                keyboardType: TextInputType.none,
                              ))
                        ],
                      ),
                    )
                  ],
                )),
            VxArc(
              height: 18,
              arcType: VxArcType.convex,
              edge: VxEdge.top,
              child: Container(
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
                        crossAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: HorizontalRowsHome(
                                  textButtonStyle: textButtonStyle1,
                                  symbol: const ["7", "8", "9"],
                                  itemCount: 3,
                                  onClick: null),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: HorizontalRowsHome(
                                  textButtonStyle: textButtonStyle1,
                                  symbol: const ["4", "5", "6"],
                                  itemCount: 3,
                                  onClick: null),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: HorizontalRowsHome(
                                  textButtonStyle: textButtonStyle1,
                                  symbol: const ["1", "2", "3"],
                                  itemCount: 3,
                                  onClick: null),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: HorizontalRowsHome(
                                  textButtonStyle: textButtonStyle1,
                                  symbol: const ["0", "."],
                                  itemCount: 2,
                                  onClick: null),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      width: 5,
                    ),
                    VStack(
                        alignment: MainAxisAlignment.center,
                        crossAlignment: CrossAxisAlignment.center,
                        spacing: 5,
                        [
                          SizedBox(
                            height: 180,
                            width: 90,
                            child: TextButton(
                                style: textButtonStyle4,
                                onPressed: () {},
                                child: "AC".text.gray800.size(42).make()),
                          ),
                          SizedBox(
                            height: 180,
                            width: 90,
                            child: TextButton(
                                style: textButtonStyle4,
                                onPressed: () {},
                                child: "=".text.gray800.size(42).make()),
                          ),
                        ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
