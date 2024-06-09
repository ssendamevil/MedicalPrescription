import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medical_prescription/domain/entities/map/map_point.dart';
import 'package:medical_prescription/presentation/components/modal_body_view.dart';
import 'package:medical_prescription/presentation/widgets/custom_marker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:widget_to_marker/widget_to_marker.dart';

class MapScreenGoogle extends StatefulWidget {
  const MapScreenGoogle({Key? key}) : super(key: key);

  @override
  State<MapScreenGoogle> createState() => _MapScreenGoogleState();
}

class _MapScreenGoogleState extends State<MapScreenGoogle> {
  GoogleMapController? _mapController;
  double _mapZoom = 10.0;
  LatLng? _userLocation;
  final Set<Marker> _markers = {};

  initMarkers() async {
    _markers.add(Marker(
      markerId: const MarkerId("1"),
      position: const LatLng(31.06976262630338, 31.23652808368206),
      icon: await const CustomMarker().toBitmapDescriptor(
          logicalSize: const Size(100, 100), imageSize: const Size(300, 300)),
    ));
    setState(() {});
  }

  @override
  void initState() {
    initMarkers();
    super.initState();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const Border(
              bottom: BorderSide(color: Colors.black12, width: 1)
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Map Title', // Replace with AppLocalizations if needed
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: const LatLng(51.5074, -0.1278), // Default to London
            zoom: _mapZoom,
          ),
          markers: _markers,
          onMapCreated: (controller) {
            _mapController = controller;
            _initLocationLayer();
          },
          onCameraMove: (cameraPosition) {
            setState(() {
              _mapZoom = cameraPosition.zoom;
            });
          },
        )
      ),
    );
  }

  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted = await Permission.location.request().isGranted;
    if (locationPermissionIsGranted) {
      _userLocation = LatLng(51.5074, -0.1278); // Example user location
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _userLocation!, zoom: _mapZoom),
        ),
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No access to user location'),
          ),
        );
      });
    }
  }

  List<MapPoint> _getMapPoints() {
    return const [
      MapPoint(name: 'EuroPharma', latitude: 51.169165, longitude: 71.413269),
      MapPoint(name: 'EuroPharma', latitude: 51.119507, longitude: 71.414026),
      MapPoint(name: 'EuroPharma', latitude: 51.172383, longitude: 71.404707),
      MapPoint(name: 'EuroPharma', latitude: 51.112141, longitude: 71.406288),
      MapPoint(name: 'EuroPharma', latitude: 51.121835, longitude: 71.420844),
      MapPoint(name: 'EuroPharma', latitude: 51.105108, longitude: 71.429395),
      MapPoint(name: 'EuroPharma', latitude: 51.101299, longitude: 71.428382),
    ];
  }
}
