import 'package:fishome/src/models/establishment_model.dart';
import 'package:fishome/src/services/establish_service.dart';
import 'package:fishome/src/theme/constant_values.dart';
import 'package:fishome/src/widgets/add_establishment_widget.dart';
import 'package:fishome/src/widgets/establishment_card.dart';
import 'package:flutter/material.dart';

class EstablecimientoWidget extends StatefulWidget {
  const EstablecimientoWidget({Key? key}) : super(key: key);

  @override
  State<EstablecimientoWidget> createState() => _EstablecimientoWidgetState();
}

class _EstablecimientoWidgetState extends State<EstablecimientoWidget> {
  final EstablecimientoService _establecimientoService =
      EstablecimientoService();
  List<Establish>? _listaMantenimientos;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print("1. Inicio del widget");
    _downloadEstablesimientos();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("2. Visualización del widget");
    return Center(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Establecimientos', style: headerStyle),
          actions: const [],
          centerTitle: true,
          elevation: 4,
          toolbarHeight: 80,
        ),
        body: SafeArea(
          //padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
          child: _listaMantenimientos == null
              ? const Center(
                  child: SizedBox.square(
                      dimension: 50.0, child: CircularProgressIndicator()),
                )
              : _listaMantenimientos!.isEmpty
                  ? const Center(
                      child: Text("No existen establecimientos registrados"))
                  : ListView(
                      children: _listaMantenimientos!
                          .map((e) => EstablecimientoCard(model: e))
                          .toList(),
                    ),
        ),
      ),
    );
  }

  _downloadEstablesimientos() async {
    // ignore: avoid_print
    print("1.1 Invocación al servicio de mantenimiento");
    _listaMantenimientos = await _establecimientoService.getEstablishment();
    if (mounted) {
      setState(() {
        // ignore: avoid_print
        print("3. Cambio de estado");
      });
    }
  }
}
