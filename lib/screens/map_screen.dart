import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).fetchCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        backgroundColor: Colors.blueAccent,
      ),
      body: locationProvider.currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: locationProvider.currentLocation!,
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                // You can set the map controller here for further use
              },
              markers: {
                if (locationProvider.currentLocation != null)
                  Marker(
                    markerId: const MarkerId('currentLocation'),
                    position: locationProvider.currentLocation!,
                    infoWindow: const InfoWindow(title: 'Your Location'),
                  ),
                if (locationProvider.destination != null)
                  Marker(
                    markerId: const MarkerId('destination'),
                    position: locationProvider.destination!,
                    infoWindow: const InfoWindow(title: 'Delivery Location'),
                  ),
              },
              polylines: locationProvider.destination != null
                  ? {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: [
                          locationProvider.currentLocation!,
                          locationProvider.destination!,
                        ],
                        color: Colors.blue,
                        width: 5,
                      ),
                    }
                  : {},
            ),
    );
  }
}
