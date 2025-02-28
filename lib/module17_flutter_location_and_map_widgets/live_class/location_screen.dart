import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  LocationData? currentLocation;
  LocationData? mytLocation;
  late StreamSubscription locationSubscription;

  @override
  void initState() {
    super.initState();
    listenToLocation();
  }

  void listenToLocation() {
    locationSubscription = location.onLocationChanged.listen((locationData) {
      mytLocation = locationData;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Location Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "My Realtime Location: ${mytLocation?.latitude ?? ""} ${mytLocation?.longitude ?? ""}"),
            StreamBuilder(
                stream: location.onLocationChanged,
                builder: (context, locationData) {
                  return Text(
                      "Realtime Location: ${locationData.data?.latitude ?? ""} ${locationData.data?.longitude ?? ""}");
                }),
            Text(
                "My Location: ${currentLocation?.latitude ?? ""} ${currentLocation?.longitude ?? ""}"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                currentLocation = await location.getLocation();
                print(currentLocation?.latitude);
                print(currentLocation?.longitude);
                print(currentLocation?.altitude);
                if (mounted) {
                  setState(() {});
                }
              },
              child: const Text(
                "Get Current Location",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              "Has Permission?",
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                PermissionStatus status = await location.hasPermission();
                if (status == PermissionStatus.denied ||
                    status == PermissionStatus.deniedForever) {
                  await location.requestPermission();
                  await location.getLocation();
                }
              },
              child: const Text(
                "Get Permission",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    locationSubscription.cancel();
  }
}
