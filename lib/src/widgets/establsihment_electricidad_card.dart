import 'package:fixhome/src/models/establishment_model.dart';
import 'package:fixhome/src/theme/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class EstablecimientoElectricidadCard extends StatelessWidget {
  const EstablecimientoElectricidadCard({Key? key, required this.model})
      : super(key: key);
  final Establish model;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Url = model.imageUrl!;
    int? intVar = model.quealification;
    double doubleVar = intVar!.toDouble();
    // ignore: avoid_print
    print("3. Cambio de estado");
    if (model.typeEstablish == "Electricidad") {
      return Shimmer(
        child: Card(
          borderOnForeground: true,
          shape: roundedRectangle12,
          margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
          elevation: 5.0,
          child: ListTile(
            title: Text(
              model.name ?? "",
              style: cardtitleStyle,
              textAlign: TextAlign.center,
            ),

            // subtitle: Text(model.description ?? ""),
            subtitle: ListTile(
              title: Text(
                model.description ?? "",
                style: cardStyle,
              ),
              subtitle: RatingBar.builder(
                initialRating: doubleVar,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // ignore: avoid_print
                  print(model.quealification);
                },
              ),
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  minHeight: 260,
                  maxWidth: 104,
                  maxHeight: 264,
                ),
                child: Image.network(Url, fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        duration: Duration(seconds: 2),
        // This is NOT the default value. Default value: Duration(seconds: 0)
        interval: Duration(seconds: 3),
        // This is the default value
        color: Colors.cyanAccent,
        // This is the default value
        colorOpacity: 0.2,
        // This is the default value
        enabled: true,
        // This is the default value
        direction: ShimmerDirection.fromLBRT(),
      );
    } else {
      return const Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
      );
    }
  }
}
