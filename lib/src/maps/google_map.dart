import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/init/translation/locale_keys.g.dart';

class GoogleMapPage extends StatelessWidget {
  final double mapLat;
  final double mapLong;
  const GoogleMapPage({Key? key, required this.mapLat, required this.mapLong})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.mainText_location.tr())),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(mapLat, mapLong), zoom: 17),
        markers: {
          Marker(
              markerId: MarkerId(LocaleKeys.mainText_location.tr()),
              position: LatLng(mapLat, mapLong))
        },
      ),
    );
  }
}
