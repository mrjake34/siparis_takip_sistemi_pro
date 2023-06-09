import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../core/singletons/translation/locale_keys.g.dart';


class FlutterMapPage extends StatelessWidget {
  const FlutterMapPage({super.key, this.mapLat, this.mapLng});
  final double? mapLat;
  final double? mapLng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_location.tr()),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(mapLat ?? 0.0, mapLng ?? 0.0),
        ),
        children: [
          TileLayer(
            urlTemplate:
            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: [
              Marker(point: LatLng(mapLat ?? 0.0, mapLng ?? 0.0),
                builder: (BuildContext context) {
                return const Icon(Icons.location_on, color: Colors.blue,);
                },

              )
            ],
          )
        ],
      ),
    );
  }
}
