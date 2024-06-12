import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onTap, required this.txt,this.isLoading = false,
  });
  final void Function()? onTap;
  final String txt;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
            color: const Color(0xFF34A853),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: isLoading ? const CircularProgressIndicator(): Center(
            child: Text(
              txt,
              style: Styles.style22,
            )),
      ),
    );
  }
}
