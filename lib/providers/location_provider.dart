import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class LocationProvider with ChangeNotifier {
  LatLng? _currentLocation;
  LatLng? _destination;

  LatLng? get currentLocation => _currentLocation;
  LatLng? get destination => _destination;

  void updateLocation(LatLng location) {
    _currentLocation = location;
    notifyListeners();
  }

  void setDestination(LatLng destination) {
    _destination = destination;
    notifyListeners();
  }

  Future<void> fetchCurrentLocation() async {
    Location location = Location();
    
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final currentLocationData = await location.getLocation();
    _currentLocation = LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
    notifyListeners();
  }
}
