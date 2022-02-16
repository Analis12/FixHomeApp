import 'package:fixhome/src/theme/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:fixhome/src/bloc/signup_bloc.dart';
import 'package:fixhome/src/models/user_model.dart';
import 'package:fixhome/src/services/user_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final SignUpBloc _signUpBloc = SignUpBloc();

  final List<String> _roles = ["Coordinador", "Supervisor", "Líder técnico"];
  String _roleSelected = "Supervisor";

  final UsuarioService _usrServ = UsuarioService();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.6,
                0.5,
              ],
              colors: [
                Colors.white,
                Colors.cyan,
              ],
            )),
            height: size * 0.99,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 35.0, right: 35.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Registro de usuario",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 25,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 130.0, left: 35.0, right: 35.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo_small.png')),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).hintColor, width: 2.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<String>(
                            stream: _signUpBloc.usernameStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  style: formStyle,
                                  autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeUsername,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.person),
                                      labelText: "Nombre",
                                      hintText: "Nombre y apellido"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.identificationStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  style: formStyle,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  onChanged: _signUpBloc.changeidentification,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.card_giftcard),
                                      labelText: "Cedula de Identidad",
                                      hintText: "1850045376"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.emailStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  style: formStyle,
                                  autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeEmail,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.email),
                                      labelText: "Correo electrónico",
                                      hintText: "admin@fixhome.com"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.passwordStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  style: formStyle,
                                  autofocus: true,
                                  onChanged: _signUpBloc.changePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            _obscureText = !_obscureText;
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          )),
                                      icon: const Icon(Icons.lock),
                                      labelText: "Contraseña"));
                            }),
                        DropdownButton<String>(
                            onChanged: (String? newValue) {
                              _obscureText = !_obscureText;
                              _roleSelected = newValue!;
                              setState(() {});
                            },
                            value: _roleSelected,
                            autofocus: true,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: formStyle,
                            underline:
                                Container(height: 2, color: Colors.black),
                            items: _roles
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: formStyle),
                              );
                            }).toList()),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: StreamBuilder<bool>(
                              stream: _signUpBloc.formSignUpStream,
                              builder: (context, snapshot) {
                                return ElevatedButton.icon(
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            User usr = User(
                                                role: _roleSelected,
                                                displayName:
                                                    _signUpBloc.username,
                                                email: _signUpBloc.email,
                                                password: _signUpBloc.password,
                                                identification:
                                                    _signUpBloc.identification);
                                            int estado1 =
                                                await _usrServ.postUsuario(usr);

                                            if (estado1 == 201) {
                                              Navigator.pop(context);
                                            }
                                          }
                                        : null,
                                    icon: const Icon(Icons.save),
                                    label: const Text("Guardar",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400)));
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
