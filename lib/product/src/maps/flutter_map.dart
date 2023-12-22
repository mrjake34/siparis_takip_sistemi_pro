import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';

class FlutterMapPage extends StatelessWidget {
  const FlutterMapPage({super.key, this.mapLat, this.mapLng});
  final double? mapLat;
  final double? mapLng;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(mapLat ?? 0.0, mapLng ?? 0.0),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(mapLat ?? 0.0, mapLng ?? 0.0),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
