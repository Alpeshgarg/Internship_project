import 'package:flutter/material.dart';

class OrderDetailPopup extends StatelessWidget {
  const OrderDetailPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order ID: JK548550801',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RichText(
              text: const TextSpan(
                text: 'Customer Name: ',
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'K. Pollard',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Text('Order Type: Delivery'),
            const Text('Date and Time: 26/03/2024 16:00'),
            const Text('Payment Status: Unpaid'),
            const Text(
              'Status: Arrived at Destination',
              style: TextStyle(color: Colors.orange),
            ),
            const SizedBox(height: 16),
            const Text(
              'Delivery Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Building Number: 43'),
            const Text('Street Name: Dutta Street'),
            const Text('Street Address: 92, Hinjewadi,'),
            const Text('State: Dadra and Nagar Haveli'),
            const Text('City: Vadodara'),
            const Text('Post Code: 473470'),
            const Text('Mobile Number: +91 8451110000'),
            const SizedBox(height: 16),
            const Text(
              'Item Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('1. Mi A series 108 cm (43 inch) Full HD LED Smart Google TV 2023 Edition with FHD'),
            const Text('2. Mi A series 108 cm (43 inch) Full HD LED Smart Google TV 2023 Edition with FHD'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: OrderDetailPopup(),
  ));
}
