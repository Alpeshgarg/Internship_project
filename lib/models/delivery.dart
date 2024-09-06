class Delivery {
  final String orderId;
  final String paymentMethod;
  final String totalPayment;
  final String streetAddress1;
  final String streetAddress2;

  Delivery({
    required this.orderId,
    required this.paymentMethod,
    required this.totalPayment,
    required this.streetAddress1,
    required this.streetAddress2,
  });
}
