import 'package:fishome/src/models/establishment_model.dart';
import 'package:fishome/src/widgets/add_establishment_widget.dart';
import 'package:flutter/material.dart';

class EstablishmentDetailWidget extends StatefulWidget {
  const EstablishmentDetailWidget({Key? key, required this.establish})
      : super(key: key);
  final Establish establish;

  @override
  State<EstablishmentDetailWidget> createState() =>
      _EstablishmentDetailWidgetState();
}

class _EstablishmentDetailWidgetState extends State<EstablishmentDetailWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(child: Text("No existen Datos")),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              EstablishFormWidget(
                idEstablishment: widget.establish.idEstablecimiento ?? "",
              );
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add)));
  }
}
