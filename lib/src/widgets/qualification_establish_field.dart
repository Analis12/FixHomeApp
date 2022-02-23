import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Qualification extends StatelessWidget {
  const Qualification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FormBuilderSlider(
        name: 'slider',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.min(context, 6),
        ]),
        min: 1.0,
        max: 5.0,
        initialValue: 1,
        divisions: 5,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.blue[100],
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'Califica este Servicio',
        ),
      ),
    );
  }
}
