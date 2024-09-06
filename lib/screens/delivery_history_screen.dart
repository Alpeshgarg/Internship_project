import 'package:bhanumart_delivery_app/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryHistoryScreen extends StatelessWidget {
  const DeliveryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).order;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter track number',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders;
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.local_shipping),
                      title: Text(order.id),
                      subtitle: Text(
                        'Status: ${order.status}',
                        style: TextStyle(
                          color: order.status == 'Delivered'
                              ? Colors.green
                              : order.status == 'Cancelled'
                                  ? Colors.red
                                  : Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
