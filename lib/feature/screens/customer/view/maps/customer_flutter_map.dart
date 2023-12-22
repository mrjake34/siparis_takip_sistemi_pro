import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/product/providers/customer_provider.dart';

class AddCustomerFlutterMap extends StatelessWidget {
  const AddCustomerFlutterMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_chooseLocation.tr()),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(
            context.watch<CustomerMapProvider>().getPosition.latitude,
            context.watch<CustomerMapProvider>().getPosition.longitude,
          ),
          zoom: 17,
          onTap: (position, latlong) {
            context
                .read<CustomerMapProvider>()
                .setPosition(latlong.latitude, latlong.longitude);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  context.watch<CustomerMapProvider>().getPosition.latitude,
                  context.watch<CustomerMapProvider>().getPosition.longitude,
                ),
                builder: (BuildContext context) {
                  return const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
