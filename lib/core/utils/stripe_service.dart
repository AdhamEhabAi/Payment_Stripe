import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/core/utils/api_keys.dart';
import 'package:paymentapp/core/utils/api_service.dart';
import 'package:paymentapp/features/checkout/data/models/EphemeralKeyModel.dart';
import 'package:paymentapp/features/checkout/data/models/PaymentIntentModel.dart';
import 'package:paymentapp/features/checkout/data/models/initPaymentSheetInputModel.dart';
import 'package:paymentapp/features/checkout/data/models/payment_intent_input_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'adham',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustomer(PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      body: {
        'customer': customerId,
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      headers: {
        'Stripe-Version': '2024-04-10',
      },
      token: ApiKeys.secretKey,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
