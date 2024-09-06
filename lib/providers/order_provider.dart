import 'package:bhanumart_delivery_app/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  final Order _order = Order(
    orderId: 'JK548550801',
    customerName: 'K. Pollard',
    orderType: 'Delivery',
    dateTime: '26/03/2024 16:00',
    paymentStatus: 'Unpaid',
    status: 'Arrived at Destination',
    deliveryAddress: 'Building Number: 43, Dutta Street, 92, Hinjewadi, Dadra and Nagar Haveli, Vadodara, 473470',
    mobileNumber: '+91 8451110000',
    items: [
      'Mi A series 108 cm (43 inch) Full HD LED Smart Google TV 2023 Edition with FHD',
      'Mi A series 108 cm (43 inch) Full HD LED Smart Google TV 2023 Edition with FHD',
    ],
  );

  Order get order => _order;
}
