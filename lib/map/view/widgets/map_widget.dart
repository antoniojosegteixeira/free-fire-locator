import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_fire_location/map/view/cubit/fire/fire_cubit.dart';
import 'package:free_fire_location/map/view/pages/splash_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  // Implement user coordinates

  static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FireCubit, FireState>(
      builder: ((context, state) {
        if (state is FireSuccess) {
          return GoogleMap(
            mapToolbarEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(state.markers),
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          );
        }

        return const SplashPage();
      }),
    );
  }
}
