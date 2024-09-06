import 'package:flutter/material.dart';
import '../models/delivery.dart';

class DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  final VoidCallback onTap;

  const DeliveryCard({super.key, required this.delivery, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text('Order ID: ${delivery.orderId}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment Method: ${delivery.paymentMethod}'),
            Text('Total Payment: ${delivery.totalPayment}'),
            Text('Street: ${delivery.streetAddress1}'),
            Text('Street: ${delivery.streetAddress2}'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.orange),
        onTap: onTap,
      ),
    );
  }
}
