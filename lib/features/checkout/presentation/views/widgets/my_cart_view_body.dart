import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/features/checkout/data/repos/chechout_repo_impl.dart';
import 'package:paymentapp/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:paymentapp/features/checkout/presentation/views/widgets/total_price_item.dart';

class MYCartViewBody extends StatelessWidget {
  const MYCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/Group 6.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: 'Discount', value: '\$0'),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: 'Shipping', value: '\$8'),
          const Divider(
            thickness: 2,
            height: 34,
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 16,
          ),
           CustomButton(txt: 'Complete Payment',onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return const PaymentDetailsView();
            // },));
             showModalBottomSheet(shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16),
             ),context: context, builder: (context) {
               return BlocProvider(
                 create: (context) => PaymentCubit(CheckoutRepoImpl()),
                   child: const PaymentMethodsBottomSheet());
             },);
          },),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}


