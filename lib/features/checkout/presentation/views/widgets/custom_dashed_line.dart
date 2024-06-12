import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      List.generate(42 , (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          height: 1,
          width: 3,
          color: Colors.black,
        ),
      )),
    );
  }
}
