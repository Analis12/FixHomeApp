import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ContactOwner extends StatelessWidget {
  const ContactOwner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: FormBuilderTextField(
        name: "contactOwner",
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.add_ic_call_sharp),
          labelText: "Telefono",
          hintText: "Ingresa el telefono de contacto del establecimiento",
          suffixIcon: const Icon(Icons.cancel),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.teal)),
        ),
        validator: FormBuilderValidators.required(context,
            errorText: "Debe Ingresar un telefono"),
      ),
    );
  }
}
