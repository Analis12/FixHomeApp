import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fixhome/src/pages/photo_upload.dart';
import 'package:fixhome/src/widgets/contact_owner_establish_field.dart';
import 'package:fixhome/src/widgets/description_establish_field.dart';
import 'package:fixhome/src/widgets/latitud_establish.dart';
import 'package:fixhome/src/widgets/long_establish.dart';
import 'package:fixhome/src/widgets/name_establish_field.dart';
import 'package:fixhome/src/widgets/owner_name_establish_field.dart';
import 'package:fixhome/src/widgets/qualification_establish_field.dart';
import 'package:fixhome/src/widgets/type_establish_field.dart';

class EstablishForm extends StatefulWidget {
  const EstablishForm({Key? key}) : super(key: key);

  @override
  State<EstablishForm> createState() => _EstablishFormState();
}

class _EstablishFormState extends State<EstablishForm> {
  final _formState = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Establecimiento"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: saveEstablish,
      ),
      body: FormBuilder(
        key: _formState,
        child: ListView(
          children: const [
            Name(),
            Description(),
            OwnerName(),
            LatitudEstablish(),
            LongitudEstablish(),
            ContactOwner(),
            Qualification(),
            TypeEstablishment(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_a_photo_sharp),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UploadImage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  saveEstablish() async {
    bool validation = _formState.currentState!.saveAndValidate();
    if (validation) {
      // ignore: avoid_print
      print("Guardado");
      final valores = _formState.currentState!.value;
      final nombre = valores['nombre'];
      // ignore: avoid_print
      print(nombre);
    }
  }
}
