// lib/providers/order_provider.dart
import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [
    // Sample orders
    Order(
      orderId: 'JK548550801',
      customerName: 'K. Pollard',
      orderType: 'Delivery',
      dateTime: '26/03/2024 16:00',
      paymentStatus: 'Unpaid',
      status: 'Arrived at Destination',
      deliveryAddress: 'Building Number: 43, Dutta Street, 92, Hinjewadi, Dadra and Nagar Haveli, Vadodara, 473470',
      mobileNumber: '+91 8451110000',
      items: [
        'Burger',
        'Pizza',
      ],
    ),
    // Add more orders here
  ];

  List<Order> _filteredOrders = [];

  OrderProvider() {
    _filteredOrders = _orders;
  }

  List<Order> get orders => _filteredOrders;

  void searchOrders(String query) {
    if (query.isEmpty) {
      _filteredOrders = _orders;
    } else {
      _filteredOrders = _orders.where((order) {
        return order.orderId.contains(query);
      }).toList();
    }
    notifyListeners();
  }
}
