import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final Location _location = Location();
  Marker? _marker;
  Polyline? _polyline;
  final List<LatLng> _polylineCoordinates = [];

  _initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData result) {
      if (_mapController != null) {
        _updateMarker(result);
        _updatePolyline(result);
        _animateToLocation(result);
      }
    });

    Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      LocationData locationData = await _location.getLocation();
      if (_mapController != null) {
        _updateMarker(locationData);
        _updatePolyline(locationData);
        _animateToLocation(locationData);
      }
    });
  }

  _showInfoWindow(LocationData locationData) {
    _mapController!.showMarkerInfoWindow(const MarkerId('myLocation'));
  }

  _updateMarker(LocationData locationData) {
    setState(() {
      _marker = Marker(
        infoWindow: InfoWindow(
          title: "My Current Location",
          snippet: "${locationData.latitude!}, ${locationData.longitude!}",
        ),
        markerId: const MarkerId('myLocation'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        onTap: () {
          _showInfoWindow(locationData);
        },
      );
    });
  }

  _updatePolyline(LocationData locationData) {
    if (_polylineCoordinates.isNotEmpty) {
      _polylineCoordinates
          .add(LatLng(locationData.latitude!, locationData.longitude!));

      setState(() {
        _polyline = Polyline(
          polylineId: const PolylineId('trackingPath'),
          color: Colors.blue,
          points: _polylineCoordinates,
          visible: true,
          width: 6,
        );
      });
    }
  }

  _animateToLocation(LocationData locationData) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Real-Time Location Tracker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 17,
        ),
        markers: _marker != null ? <Marker>{_marker!} : <Marker>{},
        polylines: _polyline != null ? <Polyline>{_polyline!} : <Polyline>{},
      ),
    );
  }
}
