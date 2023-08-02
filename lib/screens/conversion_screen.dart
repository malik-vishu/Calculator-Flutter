import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/home_rows.dart';
import '../components/themes.dart';

class ConversionScreen extends StatefulWidget {
  List<String> typeList = [];
  String? type;
  String? conversionType;
  ConversionScreen({super.key, this.conversionType}) {
    if (conversionType == "Length") {
      typeList = lengthList;
      type = "L";
    } else if (conversionType == "Mass") {
      typeList = massList;
      type = "M";
    } else if (conversionType == "Area") {
      typeList = areaList;
      type = "A";
    } else if (conversionType == "Temperature") {
      typeList = tempList;
      type = "T";
    } else if (conversionType == "Data") {
      typeList = tempList;
      type = "D";
    } else {
      typeList = ["a", "b"];
    }
    print("typelist:$typeList");
  }
  @override
  State<ConversionScreen> createState() =>
      _ConversionScreenState(typeList, type);
}

class _ConversionScreenState extends State<ConversionScreen> {
  bool field1 = false;
  bool field2 = false;

  String field1Text = "";
  String field2Text = "";

  _ConversionScreenState(List<String> typeList, String? t) {
    dropdownValue2 = typeList.first;
    dropdownValue = typeList.first;
    type = t;
  }
  String? dropdownValue2;

  String? dropdownValue;

  String? type;

  onClick(value) {
    print(value);
    if (field1 && !field2) {
      // print("Field one is true and Field two is False");
      if (value == "AC") {
        field1Text = "";
        field2Text = "";
      } else {
        if (value == "<") {
          field1Text = field1Text.substring(0, field1Text.length - 1);
          if (field1Text.isEmpty) {
            field2Text = "0";
          }
        } else {
          field1Text += value;
        }
        if (field1Text.isNotEmptyAndNotNull) {
          field2Text = conversionFunction(
                  field1Text, dropdownValue!, dropdownValue2!,
                  type: type!)
              .toString();
          if (field2Text.endsWith(".0")) {
            field2Text = field2Text.substring(0, field2Text.length - 2);
          }
        }
      }
    } else if (!field1 && field2) {
      // print("Field One is false And Field Two Is true ");
      if (value == "AC") {
        field2Text = "";
        field1Text = "";
      } else {
        if (value == "<") {
          field2Text = field2Text.substring(0, field2Text.length - 1);
          if (field2Text.isEmpty) {
            field1Text = "0";
          }
        } else {
          field2Text += value;
        }
        if (field2Text.isNotEmptyAndNotNull) {
          field1Text = conversionFunction(
                  field2Text, dropdownValue2!, dropdownValue!,
                  type: type!)
              .toString();
          if (field1Text.endsWith(".0")) {
            field1Text = field1Text.substring(0, field1Text.length - 2);
          }
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
                              dropdownColor:
                                  const Color.fromARGB(255, 82, 82, 82),
                              onChanged: (String? value) {
                                dropdownValue = value!;

                                setState(() {
                                  onClick("");
                                });
                              },
                              items: widget.typeList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: AutoSizeText(
                                    value,
                                    maxLines: 1,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 280,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
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
                              dropdownColor:
                                  const Color.fromARGB(255, 82, 82, 82),
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
                              items: widget.typeList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: AutoSizeText(
                                    value,
                                    maxLines: 1,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 280,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
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

List<String> lengthList = ["km", "m", "cm", "mm", "um", "nm"];
List<String> massList = ["kg", "gm", "pound", "mg", "ug", "ng"];
List<String> areaList = ["m^2", "cm^2", "ac", "ha", "km^2", "mile^2"];
List<String> tempList = ["C", "K", "F", "R", "Re"];

conversionFunction(String fieldText, String from, String to,
    {String type = "L"}) {
  //TODO
  if (type == "L") {
    Map<String, LENGTH> mp = {
      "km": LENGTH.kilometers,
      "m": LENGTH.meters,
      "cm": LENGTH.centimeters,
      "mm": LENGTH.millimeters,
      "um": LENGTH.micrometers,
      "nm": LENGTH.nanometers
    };
    var length = Length(significantFigures: 5)
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
  } else if (type == "M") {
    Map<String, MASS> mp = {
      "kg": MASS.kilograms,
      "gm": MASS.grams,
      "pound": MASS.pounds,
      "mg": MASS.milligrams,
      "ug": MASS.micrograms,
      "nm": MASS.nanograms
    };
    var mass = Mass(significantFigures: 5)
      ..convert(mp[from]!, double.parse(fieldText));

    Map<String, Unit> mp1 = {
      "kg": mass.kilograms,
      "gm": mass.grams,
      "pound": mass.pounds,
      "mg": mass.milligrams,
      "ug": mass.micrograms,
      "ng": mass.nanograms
    };

    var ans = mp1[to]!.value;
    return ans;
  } else if (type == "A") {
    Map<String, AREA> mp = {
      "m^2": AREA.squareMeters,
      "cm^2": AREA.squareCentimeters,
      "ac": AREA.acres,
      "ha": AREA.hectares,
      "km^2": AREA.squareKilometers,
      "mile^2": AREA.squareMiles
    };
    var area = Area(
      significantFigures: 5,
    )..convert(mp[from]!, double.parse(fieldText));

    Map<String, Unit> mp1 = {
      "m^2": area.squareMeters,
      "cm^2": area.squareCentimeters,
      "ac": area.acres,
      "ha": area.hectares,
      "km^2": area.squareKilometers,
      "mile^2": area.squareMiles
    };

    var ans = mp1[to]!.value;
    return ans;
  } else if (type == "T") {
    Map<String, TEMPERATURE> mp = {
      "C": TEMPERATURE.celsius,
      "K": TEMPERATURE.kelvin,
      "F": TEMPERATURE.fahrenheit,
      "R": TEMPERATURE.rankine,
      "Re": TEMPERATURE.reamur,
    };
    var temp = Temperature(
      significantFigures: 5,
    )..convert(mp[from]!, double.parse(fieldText));

    Map<String, Unit> mp1 = {
      "C": temp.celsius,
      "K": temp.kelvin,
      "F": temp.fahrenheit,
      "R": temp.rankine,
      "Re": temp.reamur,
    };

    var ans = mp1[to]!.value;
    return ans;
  } else if (type == "D") {
    Map<String, DIGITAL_DATA> mp = {
      "b": DIGITAL_DATA.bit,
      "B": DIGITAL_DATA.byte,
      "Kb": DIGITAL_DATA.kilobit,
      "KB": DIGITAL_DATA.kilobyte,
      "MB": DIGITAL_DATA.megabyte,
      "GB": DIGITAL_DATA.gigabyte,
      "TB": DIGITAL_DATA.terabyte,
      "PB": DIGITAL_DATA.petabyte,
    };
    var data = DigitalData(
      significantFigures: 5,
    )..convert(mp[from]!, double.parse(fieldText));

    Map<String, Unit> mp1 = {
      "b": data.bit,
      "B": data.byte,
      "Kb": data.kilobit,
      "KB": data.kilobyte,
      "MB": data.megabyte,
      "GB": data.gigabyte,
      "TB": data.terabyte,
      "PB": data.petabyte,
    };

    var ans = mp1[to]!.value;
    return ans;
  }
}
