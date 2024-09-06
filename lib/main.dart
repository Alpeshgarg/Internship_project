import 'package:bhanumart_delivery_app/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/order_provider.dart';
import 'providers/profile_provider.dart';
import 'screens/available_deliveries_screen.dart';
import 'screens/collected_money_screen.dart';
import 'screens/delivery_history_screen.dart';
import 'screens/map_screen.dart';
import 'screens/profile_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
        routes: {
          '/available': (context) => const AvailableDeliveriesScreen(),
          '/collected': (context) => CollectedMoneyScreen(),
          '/history': (context) => const DeliveryHistoryScreen(),
          '/profile': (context) => ProfileScreen(),
          '/map': (context) => const MapScreen(),
        },
      ),
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const AvailableDeliveriesScreen(),
    CollectedMoneyScreen(),
    const DeliveryHistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Colors.black),
            label: 'Collected Money',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.black),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
