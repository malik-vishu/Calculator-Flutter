import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HorizontalRowsHome extends StatelessWidget {
   HorizontalRowsHome({
    super.key,
    required this.textButtonStyle,
    required this.symbol,
    this.itemCount = 4, required  this.onClick,
  });
  final List<String> symbol;
  final ButtonStyle textButtonStyle;
  final int itemCount;
  Function(dynamic value)? onClick;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 3, 2, 3),
          child: TextButton(
            style: textButtonStyle,
            onPressed: () => onClick!(symbol[index]),
            child: symbol[index].text.size(42).gray800.make(),
          ),
        );
      },
    );
  }
  
  
}
