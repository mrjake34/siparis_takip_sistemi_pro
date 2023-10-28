// ignore_for_file: public_member_api_docs,
//sort_constructors_first, must_be_immutable
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:siparis_takip_sistemi_pro/core/utils/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/providers/customer_provider.dart';

class AddCustomerGoogleMap extends StatefulWidget {
  const AddCustomerGoogleMap({
    super.key,
  });

  @override
  State<AddCustomerGoogleMap> createState() => _AddCustomerGoogleMapState();
}

class _AddCustomerGoogleMapState extends State<AddCustomerGoogleMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  final Set<Marker> _markers = {};

  @override
  void initState() {
    if (context.read<CustomerMapProvider>().getPosition.latitude != 0 && context.read<CustomerMapProvider>().getPosition.longitude != 0) {
      _markers.add(
        Marker(
          draggable: true,
          flat: true,
          markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
          position: LatLng(
            context.read<CustomerMapProvider>().getPosition.latitude,
            context.read<CustomerMapProvider>().getPosition.longitude,
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_addLocation.tr()),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            context.watch<CustomerMapProvider>().getPosition.latitude,
            context.watch<CustomerMapProvider>().getPosition.longitude,
          ),
          zoom: 17,
        ),
        onMapCreated: _controller.complete,
        markers: _markers,
        onTap: (position) {
          _markers.add(
            Marker(
              draggable: true,
              flat: true,
              markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
              position: position,
            ),
          );
          context.read<CustomerMapProvider>().setPosition(position.latitude, position.longitude);
        },
      ),
    );
  }
}
