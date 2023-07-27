import 'package:flutter/material.dart';

final ButtonStyle textButtonStyle1 = ButtonStyle(
    overlayColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return Colors.orange[500];
      if (states.contains(MaterialState.hovered)) {
        return Colors.blue.withOpacity(0.4);
      }
      if (states.contains(MaterialState.pressed)) {
        return Colors.blue.withOpacity(0.5);
      }
      return null;
    }),
    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    minimumSize: const MaterialStatePropertyAll(Size(88, 70)),
    maximumSize: const MaterialStatePropertyAll(Size(110, 70)),
    shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    )),
    padding: const MaterialStatePropertyAll(EdgeInsets.zero));

final ButtonStyle textButtonStyle2 = ButtonStyle(
    overlayColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) {
        return const Color.fromARGB(255, 134, 165, 219);
      }
      if (states.contains(MaterialState.hovered)) {
        return Colors.blue.withOpacity(0.4);
      }
      if (states.contains(MaterialState.pressed)) {
        return Colors.blue.withOpacity(0.5);
      }
      return null;
    }),
    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    minimumSize: const MaterialStatePropertyAll(Size(165, 70)),
    maximumSize: const MaterialStatePropertyAll(Size(180, 70)),
    shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    )),
    padding: const MaterialStatePropertyAll(EdgeInsets.zero));

 final ButtonStyle textButtonStyle3 = ButtonStyle(
  overlayColor:
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return const Color.fromARGB(255, 134, 165, 219);
    }
    if (states.contains(MaterialState.hovered)) {
      return Colors.blue.withOpacity(0.4);
    }
    if (states.contains(MaterialState.pressed)) {
      return const Color.fromARGB(255, 125, 134, 141).withOpacity(0.5);
    }
    return null;
  }),
  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
  minimumSize: const MaterialStatePropertyAll(Size(120, 70)),
  maximumSize: const MaterialStatePropertyAll(Size(180, 70)),
  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  )),
  // padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
);

List<Color> homeBlueColor = <Color>[
  Color(0xFF0D47A1),
  Color(0xFF1976D2),
  Color(0xFF42A5F5),
];

List<Color> homeGrayColor = <Color>[
  Color.fromARGB(255, 49, 49, 50),
  Color.fromARGB(255, 84, 84, 92),
];
