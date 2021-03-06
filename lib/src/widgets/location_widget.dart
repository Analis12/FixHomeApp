import 'dart:async';
import 'package:fixhome/src/models/establishment_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _mkAmbato = const CameraPosition(
    target: LatLng(-1.24167, -78.6197),
    zoom: 9,
  );

  final Stream<QuerySnapshot> _establecimientoStrem =
      FirebaseFirestore.instance.collection('establishment').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _establecimientoStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child:
                  SizedBox(child: Text('Error al consultar establecimientos.')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData) {
            Set<Marker> mkEstablish =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Establish model =
                  Establish.fromJson(document.data() as Map<String, dynamic>);

              Marker marker = Marker(
                  icon: model.typeEstablish == "Carpinteria"
                      ? BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed)
                      : model.typeEstablish == "Albañileria"
                          ? BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueYellow)
                          : model.typeEstablish == "Cerrajeria"
                              ? BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueBlue)
                              : model.typeEstablish == "Electricidad"
                                  ? BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueCyan)
                                  : model.typeEstablish == "Jardineria"
                                      ? BitmapDescriptor.defaultMarkerWithHue(
                                          BitmapDescriptor.hueViolet)
                                      : BitmapDescriptor.defaultMarkerWithHue(
                                          BitmapDescriptor.hueGreen),
                  infoWindow:
                      InfoWindow(title: model.name, snippet: model.description),
                  markerId: MarkerId(model.idEstablecimiento ?? ""),
                  position:
                      LatLng(model.lat ?? -0.9333, model.lng ?? -78.6185));

              return marker;
            }).toSet();

            return GoogleMap(
              markers: mkEstablish,
              mapType: MapType.terrain,
              initialCameraPosition: _mkAmbato,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }

          return const SizedBox();
        });
  }
}
