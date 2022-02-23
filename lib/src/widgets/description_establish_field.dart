import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: FormBuilderTextField(
        name: "description",
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.description),
          labelText: "Ingrese una descripción",
          hintText: "Descripción del establecimiento",
          suffixIcon: const Icon(Icons.cancel),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.teal)),
        ),
        validator: FormBuilderValidators.required(context,
            errorText: "Debe Ingresar una Descripción"),
      ),
    );
  }
}
