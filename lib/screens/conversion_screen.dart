import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/home_rows.dart';
import '../components/themes.dart';

List<String> typeList = ["km", "m", "cm", "mm", "um", "nm"];

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({super.key});

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  String dropdownValue = typeList.first;
  String dropdownValue2 = typeList.first;

  bool field1 = false;
  bool field2 = false;

  String field1Text = "";
  String field2Text = "";

  onClick(value) {
    print(value);
    if (field1 && !field2) {
      // print("Field one is true and Field two is False");
      if (value == "AC") {
        field1Text = "";
        field2Text = "";
      } else {
        field1Text += value;
        if (field1Text.isNotEmptyAndNotNull) {
          field2Text =
              conversionFunction(field1Text, dropdownValue, dropdownValue2)
                  .toString();
        }
      }
    } else if (!field1 && field2) {
      // print("Field One is false And Field Two Is true ");
      if (value == "AC") {
        field2Text = "";
        field1Text = "";
      } else {
        field2Text += value;
        if (field2Text.isNotEmptyAndNotNull) {
          field1Text =
              conversionFunction(field2Text, dropdownValue2, dropdownValue)
                  .toString();
        }
      }
    }
    setState(() {});
  }

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
                                dropdownValue = value!;
                                setState(() {
                                  onClick("");
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
                            child: InkWell(
                                onTap: () {
                                  field1 = true;
                                  field2 = false;
                                  setState(() {});
                                },
                                child: field1Text.text
                                    .color(Colors.white70)
                                    .size(48)
                                    .make()),
                          )
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
                                dropdownValue2 = value!;
                                setState(() {
                                  onClick("");
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
                              child: InkWell(
                                  onTap: () {
                                    field2 = true;
                                    field1 = false;
                                    setState(() {});
                                  },
                                  child: field2Text.text
                                      .color(Colors.white70)
                                      .size(48)
                                      .make()))
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
                                  onClick: onClick),
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
                                  onClick: onClick),
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
                                  onClick: onClick),
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
                                  onClick: onClick),
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
                                onPressed: () => onClick("AC"),
                                child: "AC".text.gray800.size(42).make()),
                          ),
                          SizedBox(
                            height: 180,
                            width: 90,
                            child: TextButton(
                                style: textButtonStyle4,
                                onPressed: () => onClick("<"),
                                child: "<".text.gray800.size(42).make()),
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

conversionFunction(String fieldText, String from, String to) {
  //TODO
  Map<String, LENGTH> mp = {
    "km": LENGTH.kilometers,
    "m": LENGTH.meters,
    "cm": LENGTH.centimeters,
    "mm": LENGTH.millimeters,
    "um": LENGTH.micrometers,
    "nm": LENGTH.nanometers
  };
  var length = Length(significantFigures: 5, removeTrailingZeros: true)
    ..convert(mp[from]!, double.parse(fieldText));

  Map<String, Unit> mp1 = {
    "km": length.kilometers,
    "m": length.meters,
    "cm": length.centimeters,
    "mm": length.millimeters,
    "um": length.micrometers,
    "nm": length.nanometers
  };

  var ans = mp1[to]!.value;
  return ans;
}
