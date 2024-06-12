import 'package:flutter/material.dart';
import 'package:paymentapp/features/checkout/presentation/views/thank_you_view.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/payment_methods_listview.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethods()),
        SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey,autovalidateMode: autovalidateMode,)),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0,left: 16,right: 16),
                  child: CustomButton(txt: 'Pay',onTap: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                    }else{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThankYouView(),));
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {

                      });
                    }
                  },),
                ))),
      ],
    );
  }
}
