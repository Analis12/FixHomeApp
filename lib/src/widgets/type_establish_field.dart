import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TypeEstablishment extends StatelessWidget {
  const TypeEstablishment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var services = [
      "Carpinteria",
      "Reparacion de Electrodomesticos",
      "Electricidad",
      "Albañileria"
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: FormBuilderDropdown(
        name: 'Service',
        decoration: const InputDecoration(
          labelText: 'Tipo deServicio',
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
        allowClear: true,
        hint: const Text('Selecciona el tipo de Servicio'),
        validator: FormBuilderValidators.compose(
            [FormBuilderValidators.required(context)]),
        items: services
            .map((service) => DropdownMenuItem(
                  value: service,
                  child: Text(service),
                ))
            .toList(),
      ),
      // validator: FormBuilderValidators.required(context,
      //     errorText: "Debe Ingresar un servicio"),
    );
  }
}
