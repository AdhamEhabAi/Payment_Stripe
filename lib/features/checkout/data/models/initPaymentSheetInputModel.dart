class InitPaymentSheetInputModel{
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitPaymentSheetInputModel({required this.clientSecret, this.customerId = 'cus_QHDjeuX64McuH0', required this.ephemeralKeySecret});
}