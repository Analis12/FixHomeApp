import 'package:fixhome/src/models/establishment_model.dart';
import 'package:fixhome/src/pages/establishment_form.dart';
import 'package:fixhome/src/services/establish_service.dart';
import 'package:fixhome/src/theme/constant_values.dart';
import 'package:fixhome/src/widgets/add_establishment_widget.dart';
import 'package:fixhome/src/widgets/establishment_card.dart';
import 'package:flutter/material.dart';

class EstablecimientoWidget extends StatefulWidget {
  const EstablecimientoWidget({Key? key}) : super(key: key);

  @override
  State<EstablecimientoWidget> createState() => _EstablecimientoWidgetState();
}

class _EstablecimientoWidgetState extends State<EstablecimientoWidget> {
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
    // ignore: avoid_print
    print("2. Visualización del widget");
    return Material(
      child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(
              child: Image.asset(
                "assets/images/carpinteria.png",
                width: 180,
                height: 130,
              ),
            ),
            automaticallyImplyLeading: true,
            title: const Text('CARPINTERIA', style: headerStyle),
            actions: const [],
            centerTitle: true,
            elevation: 4,
            toolbarHeight: 80,
          ),
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
                            .map((e) => EstablecimientoCard(model: e))
                            .toList(),
                      ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            backgroundColor: Colors.cyan,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EstablishForm(),
                ),
              );
            },
          )),
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
