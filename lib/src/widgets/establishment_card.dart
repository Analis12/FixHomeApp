import 'package:fishome/src/models/establishment_model.dart';
import 'package:fishome/src/theme/constant_values.dart';
import 'package:flutter/material.dart';

class EstablecimientoCard extends StatelessWidget {
  const EstablecimientoCard({Key? key, required this.model}) : super(key: key);
  final Establish model;

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Url = model.imageUrl!;
    // ignore: avoid_print
    print("3. Cambio de estado" + (model.imageUrl ?? ""));
    return Card(
      borderOnForeground: true,
      shape: roundedRectangle12,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
      elevation: 5.0,
      child: SingleChildScrollView(
        child: ListTile(
          title: Text(model.name ?? ""),
          subtitle: Text(model.description ?? ""),
          trailing: Text(model.quealification.toString()),
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
    );
  }
}
