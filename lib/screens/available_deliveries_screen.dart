import 'package:bhanumart_delivery_app/providers/detail_provider.dart';
import 'package:bhanumart_delivery_app/providers/location_provider.dart';
import 'package:bhanumart_delivery_app/providers/profile_provider.dart';
import 'package:bhanumart_delivery_app/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AvailableDeliveriesScreen extends StatelessWidget {
  const AvailableDeliveriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailProvider = Provider.of<DetailProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('lib/images/Alpesh_Garg.png'),
            ),
            const SizedBox(width: 10),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Hello! ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  TextSpan(
                    text: profileProvider.name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Active Order',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Active Order Section
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset('lib/images/Alpesh_Garg.png'),
            
                title: RichText(
                text: TextSpan(
                  text: 'Order id: ',
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: detailProvider.id,
                      
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Provider.of<DetailProvider>(context).storelocation),
                      Text(Provider.of<DetailProvider>(context).deliverylocation),
                      // const Text('Lorem ipsum'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderDetailsScreen(),
                            ),
                          );
                        },
                        child: const Text('Details'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<LocationProvider>(context, listen: false).setDestination(
                            const LatLng(25.0760, 72.8777),
                          );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapScreen(),
                            ),
                          );
                        },
                        child: const Text('Direction'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Earnings Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Earnings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildEarningInfo('Today', '₹1520.54'),
                        _buildEarningInfo('This Week', '₹10120.29'),
                        _buildEarningInfo('This Month', '₹28221.66'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Order Stats Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildOrderStat('15', 'Today\'s Orders', Colors.blue),
                        _buildOrderStat('55', 'This Week Orders', Colors.purple),
                        _buildOrderStat('55', 'This Month Orders', Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
        
            ],
          ),
        ),
      ),
      
    );
  }

  Widget _buildEarningInfo(String title, String amount) {
    return Column(
      children: [
        Text(
          amount,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildOrderStat(String count, String description, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final profileProvider = Provider.of<ProfileProvider>(context);
    final detailProvider = Provider.of<DetailProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Order id: ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    
                    TextSpan(
                      // text: detailProvider.orderid,
                      text: detailProvider.id,
                      // text: '10055228552',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              
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
              RichText(
                text: const TextSpan(
                  text: 'Order Type:',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Delivery',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Date and Time: ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: '26/03/2024 16:00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Payment Status: ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Unpaid',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Status: ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Arrived at Destination',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              const Text(
                'Delivery Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
              ),
              const Text('1. Burger'),
              const Text('2. Pizza'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AvailableDeliveriesScreen(),
  ));
}
