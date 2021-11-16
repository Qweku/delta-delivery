// ignore_for_file: file_names, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initCamPosition = CameraPosition(
    target: LatLng(5.656295, -0.178262),
    zoom: 11.0,
  );
  late GoogleMapController _gMapController;
  // late Marker _origin;
  // late Marker _destination;

  @override
  void dispose() {
    _gMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initCamPosition,
          onMapCreated: (controller) => _gMapController = controller,
          // markers: {
          //   if (_origin != null) _origin,
          //   if (_destination != null) _destination
          // },
          //onLongPress: _addMarker,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: theme.primaryColor,
            foregroundColor: theme.primaryColorLight,
            onPressed: () => _gMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initCamPosition)),
            child: Icon(Icons.center_focus_strong)));
  }

  // void _addMarker(LatLng pos) {
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //         position: pos,
  //       );
  //       _destination = Marker(markerId: const MarkerId('destination'));
  //     });
  //   }else{
  //     _destination = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos,
  //       );
  //   }
  // }

}
