import 'package:fixhome/src/models/establishment_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class establishDetailsContentWidget extends StatelessWidget {
  const establishDetailsContentWidget({Key? key, required this.establish})
      : super(key: key);
  final Establish establish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        ListTile(
          leading: const Icon(Icons.business_sharp),
          title: const Text("Establecimiento"),
          subtitle: Text(establish.name ?? ""),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Descripción"),
          subtitle: Text(establish.description ?? ""),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Registrado"),
          subtitle: Text(establish.quealification.toString()),
        ),
        ListTile(
            leading: const Icon(Icons.comment),
            title: const Text("Categoria"),
            // ignore: unrelated_type_equality_checks
            subtitle: establish.typeEstablish == 0
                ? const Text("Carpinteria")
                // ignore: unrelated_type_equality_checks
                : establish.typeEstablish == 1
                    ? const Text("Albañileria")
                    // ignore: unrelated_type_equality_checks
                    : establish.typeEstablish == 2
                        ? const Text("Cerrajeria")
                        // ignore: unrelated_type_equality_checks
                        : establish.typeEstablish == 3
                            ? const Text("Electricidad")
                            // ignore: unrelated_type_equality_checks
                            : establish.typeEstablish == 4
                                ? const Text("Jardineria")
                                : const Text("Cerrajeria")),
      ]),
    );
  }
}
