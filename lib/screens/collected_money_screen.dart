import 'package:flutter/material.dart';

class CollectedMoneyScreen extends StatelessWidget {
  final List<Map<String, dynamic>> paymentHistory = [
    {'date': '2024-08-15', 'amount': 120.00, 'status': 'Paid'},
    {'date': '2024-08-16', 'amount': 100.00, 'status': 'Paid'},
    {'date': '2024-08-17', 'amount': 150.00, 'status': 'Paid'},
    {'date': '2024-08-18', 'amount': 150.00, 'status': 'Paid'},
  ];

  CollectedMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPayout = paymentHistory.fold(
      0.0,
      (previousValue, element) => previousValue + element['amount'],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Collected Money', style: TextStyle(fontSize: 20, color: Colors.white,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Total Payout',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              '\$$totalPayout',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: paymentHistory.length,
                itemBuilder: (context, index) {
                  final payment = paymentHistory[index];
                  return ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: payment['status'] == 'Paid' ? Colors.green : Colors.red,
                    ),
                    title: Text('Amount: \$${payment['amount']}'),
                    subtitle: Text('Date: ${payment['date']}'),
                    trailing: Text(
                      payment['status'],
                      style: TextStyle(
                        color: payment['status'] == 'Paid' ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle money withdrawal logic here
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Withdraw Money'),
            ),
          ],
        ),
      ),
    );
  }
}






































// import 'package:flutter/material.dart';

// class CollectedMoneyScreen extends StatelessWidget {
//   const CollectedMoneyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Collected Money'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               '\$520.00',
//               style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.green),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Total Money Collected',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle money withdrawal logic here
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
//               child: Text('Withdraw Money'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
