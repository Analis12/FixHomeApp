import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:fixhome/src/models/establishment_model.dart';
import 'package:fixhome/src/services/establish_service.dart';

class EstablishFormWidget extends StatefulWidget {
  const EstablishFormWidget({Key? key, required this.idEstablishment})
      : super(key: key);
  final String idEstablishment;

  @override
  _EstablishFormWidgetState createState() => _EstablishFormWidgetState();
}

class _EstablishFormWidgetState extends State<EstablishFormWidget> {
  late Establish _establish;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  bool _onSaving = false;
  final EstablecimientoService _establishService = EstablecimientoService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                "Recomendar un Servicio",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              )),
          const Divider(
            color: Colors.black,
            height: 25,
            thickness: 2,
            indent: 5,
            endIndent: 5,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColorDark)),
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text("Ingresar la imagen ",
                          style: Theme.of(context).textTheme.subtitle1)),
                  SizedBox(
                      height: 100,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: _imagen == null
                            ? Image.asset('assets/images/logo_large.png')
                            : Image.file(_imagen!),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () => _selectImage(ImageSource.camera),
                          icon: const Icon(Icons.camera),
                          label: const Text("C??mara")),
                      ElevatedButton.icon(
                          onPressed: () => _selectImage(ImageSource.gallery),
                          icon: const Icon(Icons.image),
                          label: const Text("Galer??a")),
                    ],
                  ),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      initialValue: _establish.name,
                      onSaved: (value) {
                        //Este evento se ejecuta cuando el Form ha sido guardado localmente
                        _establish.name =
                            value; //Asigna el valor del TextFormField al atributo del modelo
                      },
                      validator: (value) {
                        return _validateName(value!);
                      },
                      decoration:
                          const InputDecoration(labelText: "Observaci??n"),
                      maxLength: 255,
                      maxLines: 3),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: _onSaving
                          ? const CircularProgressIndicator()
                          : Tooltip(
                              message: "Registrar observaci??n ",
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    _sendForm();
                                  },
                                  label: const Text("Guardar"),
                                  icon: const Icon(Icons.save)),
                            ))
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
      //print('No image selected.');
    }
    setState(() {});
  }

  _sendForm() async {
    if (!_formKey.currentState!.validate()) return;

    _onSaving = true;
    setState(() {});

    _formKey.currentState!.save(); //Guarda el form localmente

    if (_imagen != null) {
      _establish.imageUrl = await _establishService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Foto
    int estado = await _establishService.postEstablecimiento(_establish);
    if (estado == 201) {
      _formKey.currentState!.reset();
      _onSaving = false;
      Navigator.pop(context);
    }
  }
}

_validateName(String value) {
  if (value.length < 15) {
    return "Debe ingresar al menos 15 caracteres";
  }
  return null; //Cuando se retorna nulo el campo te texto est?? validado
}
