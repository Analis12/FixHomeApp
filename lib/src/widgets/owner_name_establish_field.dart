import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class OwnerName extends StatelessWidget {
  const OwnerName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FormBuilderTextField(
        name: "ownerName",
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person_add),
          labelText: "Nombre de la persona a cargo o dueño",
          hintText: "Ingresa el nombre del dueño",
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
