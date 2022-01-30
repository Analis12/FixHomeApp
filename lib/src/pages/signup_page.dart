import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String texto = "Registro Page";
    String titulo = "Registro Page";
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text(titulo)),
            body: Center(child: Text(texto))));
  }
}
