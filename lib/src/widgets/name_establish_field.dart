import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Name extends StatelessWidget {
  const Name({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FormBuilderTextField(
        name: "name",
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.add_business_sharp),
          labelText: "Nombre del Establecimiento",
          hintText: "Ingresa el nombre del establecimiento",
          suffixIcon: const Icon(Icons.cancel),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.teal)),
        ),
        validator: FormBuilderValidators.required(context,
            errorText: "Debe Ingresar un nombre"),
      ),
    );
  }
}
