import 'package:fixhome/src/bloc/login_bloc.dart';
import 'package:fixhome/src/models/user_model.dart';
import 'package:fixhome/src/providers/main_provider.dart';
import 'package:fixhome/src/services/user_service.dart';
import 'package:fixhome/src/theme/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    final mainProvider = Provider.of<MainProvider>(context);

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
            padding: const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Inicio de sesión",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
                const Divider(
                  color: Colors.black,
                  height: 25,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
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
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).hintColor, width: 3.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<String>(
                            stream: _loginBloc.emailStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  style: formStyle,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _loginBloc.changeEmail,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.email),
                                      labelText: "Correo electrónico",
                                      hintText: "admin@fixhome.com"));
                            }),
                        StreamBuilder<String>(
                            stream: _loginBloc.passwordStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  style: formStyle,
                                  onChanged: _loginBloc.changePassword,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: StreamBuilder<bool>(
                              stream: _loginBloc.formLoginStream,
                              builder: (context, snapshot) {
                                return ElevatedButton.icon(
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            final usrSrv =
                                                UsuarioService(); //Servicio
                                            final usr = User(
                                                //Modelo
                                                email: _loginBloc.email,
                                                password: _loginBloc.password);

                                            Map<String, dynamic> resp =
                                                await usrSrv.login(usr);
                                            // ignore: avoid_print
                                            print(usr.password);
                                            if (resp.containsKey("idToken")) {
                                              mainProvider.token =
                                                  resp['idToken'];
                                            }
                                            Navigator.pushNamed(
                                                context, "/homepage");
                                          }
                                        : null,
                                    icon: const Icon(Icons.login),
                                    label: const Text("Ingresar",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400)));
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("¿No tiene cuenta?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/singup");
                        },
                        child: const Text(
                          "Regístrese",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              // ignore: unnecessary_const
                              color: const Color(0xFFFFFFFF)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
