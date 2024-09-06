class Order {
  final String orderId;
  final String customerName;
  final String orderType;
  final String dateTime;
  final String paymentStatus;
  final String status;
  final String deliveryAddress;
  final String mobileNumber;
  final List<String> items;

  Order({
    required this.orderId,
    required this.customerName,
    required this.orderType,
    required this.dateTime,
    required this.paymentStatus,
    required this.status,
    required this.deliveryAddress,
    required this.mobileNumber,
    required this.items,
  });
}
