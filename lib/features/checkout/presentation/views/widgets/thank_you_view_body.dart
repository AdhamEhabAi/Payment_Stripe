import 'package:flutter/material.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/custom_check_Icon.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(clipBehavior: Clip.none, children: [
        const ThankYouCard(),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * .2 + 20,
          right: 36,
          left: 36,
          child: const CustomDashedLine(),
        ),
        Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        const Positioned(
          left: 0,
          right: 0,
          top: -50,
          child: CustomCheckIcon(),
        ),
      ]),
    );
  }
}
