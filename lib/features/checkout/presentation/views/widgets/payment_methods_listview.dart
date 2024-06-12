import 'package:flutter/material.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/payment_details_item.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<String> paymentMethodsItem = const [
    'assets/images/Group2.svg',
    'assets/images/Group1.svg'
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 62,
      child: ListView.builder(scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItem.length,
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: (){
                activeIndex = index;
                setState(() {

                });
              },
              child: PaymentDetailsItem(
                isActive: activeIndex == index,
                image: paymentMethodsItem[index],
              ),
            ),
          );
        },),
    );
  }
}
