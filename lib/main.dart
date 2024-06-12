import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/core/utils/api_keys.dart';
import 'package:paymentapp/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey =
      ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
// paymentIntentObject create payment intent (amount , currency)
// init payment sheet (paymentIntentClientSecret)
// presentPaymentSheet ()


//  that's for saving the customer cards
// paymentIntentObject create payment intent (amount , currency, customer ID)
// keySecret createEphemeralKey(customer)
// initPaymentSheet(merchantDisplayName , intentClientSecret,EphemeralKeySecret)
// presentPaymentSheet()