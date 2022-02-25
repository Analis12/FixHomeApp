import 'package:fixhome/src/models/establishment_model.dart';
import 'package:fixhome/src/services/establish_service.dart';
import 'package:fixhome/src/widgets/establishment_albanil_card.dart';
import 'package:flutter/material.dart';

class EstablecimientoAlbanil extends StatefulWidget {
  const EstablecimientoAlbanil({Key? key}) : super(key: key);

  @override
  State<EstablecimientoAlbanil> createState() => _EstablecimientoAlbanilState();
}

class _EstablecimientoAlbanilState extends State<EstablecimientoAlbanil> {
  final EstablecimientoService _establecimientoService =
      EstablecimientoService();
  List<Establish>? _listaEstablecimientos;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print("1. Inicio del widget");
    _downloadEstablesimientos();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          //padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
          child: _listaEstablecimientos == null
              ? const Center(
                  child: SizedBox.square(
                      dimension: 50.0, child: CircularProgressIndicator()),
                )
              : _listaEstablecimientos!.isEmpty
                  ? const Center(
                      child: Text("No existen establecimientos registrados"))
                  : ListView(
                      children: _listaEstablecimientos!
                          .map((e) => EstablecimientoAlbanilCard(model: e))
                          .toList(),
                    ),
        ),
      ),
    );
  }

  _downloadEstablesimientos() async {
    // ignore: avoid_print
    print("1.1 Invocación al servicio de mantenimiento");
    _listaEstablecimientos = await _establecimientoService.getEstablishment();
    if (mounted) {
      setState(() {
        // ignore: avoid_print
        print("3. Cambio de estado");
      });
    }
  }
}
