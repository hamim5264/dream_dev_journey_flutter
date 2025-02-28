import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

/// My Api Key: AIzaSyCRGmv1YFQZq40K2MNxfEC9YpZqze9U7Cg

class GoogleMapHomeScreen extends StatefulWidget {
  const GoogleMapHomeScreen({super.key});

  @override
  State<GoogleMapHomeScreen> createState() => _GoogleMapHomeScreenState();
}

class _GoogleMapHomeScreenState extends State<GoogleMapHomeScreen> {
  late GoogleMapController googleMapController;
  Location location = Location();

  Future<void> getCurrentLocation() async {
    final LocationData locationData = await location.getLocation();
    // googleMapController.moveCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(locationData.latitude!, locationData.longitude!),),
    //   ),
    // );
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 17,
        ),
      ),
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google Map",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 19,
          target: LatLng(23.792265005916146, 90.40561775869223),
          //target: LatLng(24.81935787039022, 88.32511956711707),
          bearing: 0,
          tilt: 5,
        ),
        onTap: (LatLng position) {
          print(position);
        },
        onLongPress: (LatLng position) {
          print("on long pressed at: $position");
        },
        onCameraMove: (cameraPosition) {
          print(cameraPosition);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
          getCurrentLocation();
        },
        markers: {
          Marker(
              markerId: const MarkerId("initialPosition"),
              position: LatLng(23.792265005916146, 90.40561775869223),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
              infoWindow: InfoWindow(
                title: "This is title",
                snippet: "This is snippet",
              ),
              draggable: true,
              onDragEnd: (LatLng position) {
                print(position);
              },
              onDragStart: (LatLng position) {
                print(position);
              },
              onDrag: (LatLng position) {
                print(position);
              },
              onTap: () {
                print("tapped in map");
              }),
          Marker(
              markerId: const MarkerId("initialPosition"),
              position: LatLng(23.792265005916146, 90.40561775869223),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              infoWindow: InfoWindow(
                title: "This is title",
                snippet: "This is snippet",
              ),
              draggable: true,
              onDragEnd: (LatLng position) {
                print(position);
              },
              onDragStart: (LatLng position) {
                print(position);
              },
              onDrag: (LatLng position) {
                print(position);
              },
              onTap: () {
                print("tapped in map");
              }),
          Marker(
              markerId: const MarkerId("initialPosition"),
              position: LatLng(23.792265005916146, 90.40561775869223),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueMagenta),
              infoWindow: InfoWindow(
                title: "This is title",
                snippet: "This is snippet",
              ),
              draggable: true,
              onDragEnd: (LatLng position) {
                print(position);
              },
              onDragStart: (LatLng position) {
                print(position);
              },
              onDrag: (LatLng position) {
                print(position);
              },
              onTap: () {
                print("tapped in map");
              }),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("Basic-Line"),
            color: Colors.red,
            width: 8,
            visible: true,
            endCap: Cap.buttCap,
            jointType: JointType.mitered,
            patterns: [
              PatternItem.gap(10),
              PatternItem.dash(10),
              PatternItem.dot,
              PatternItem.dash(10),
            ],
            points: const [
              LatLng(23.792265005916146, 90.40561775869223),
              LatLng(23.791850617009043, 90.4058363288641),
              LatLng(23.792304348828043, 90.40598049759865),
              LatLng(23.792265005916146, 90.40561775869223),
            ],
          ),
        },
        polygons: {
          Polygon(
            polygonId: const PolygonId("basic-polygon"),
            visible: true,
            fillColor: Colors.yellow,
            strokeColor: Colors.red,
            strokeWidth: 6,
            consumeTapEvents: true,
            onTap: () {
              print("tapped on my area");
            },
            points: const [
              LatLng(23.791462842244965, 90.40558755397797),
              LatLng(23.79105573885445, 90.40594696998596),
              LatLng(23.791293803991216, 90.40623228996992),
              LatLng(23.79161224610833, 90.40613975375891),
              LatLng(23.791569603134047, 90.40577128529549),
            ],
          ),
        },
        circles: {
          Circle(
              circleId: const CircleId("basic-circle"),
              center: const LatLng(23.791795089206374, 90.40525194257498),
              radius: 20,
              fillColor: Colors.red,
              strokeColor: Colors.green,
              strokeWidth: 6,
              consumeTapEvents: true,
              onTap: () {
                print("tapped on circle");
              }),
        },
      ),
    );
  }
}
