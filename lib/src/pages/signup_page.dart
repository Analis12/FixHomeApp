import 'package:flutter/material.dart';
import 'package:fixhome/src/bloc/signup_bloc.dart';
import 'package:fixhome/src/models/user_model.dart';
import 'package:fixhome/src/services/user_service.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final SignUpBloc _signUpBloc = SignUpBloc();
  final List<String> _roles = ["Cliente", "Supervisor", "Dueño"];
  String _roleSelected = "Supervisor";
  final UsuarioService _usrServ = UsuarioService();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            height: size * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 35.0, right: 35.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Registro de usuario",
                      style: Theme.of(context).textTheme.headline4!.apply(
                          color: Theme.of(context).scaffoldBackgroundColor)),
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
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeUsername,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.person),
                                      labelText: "Nombre",
                                      hintText: "Nombre y apellido"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.usernameStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  keyboardType: TextInputType.text,
                                  onChanged: _signUpBloc.changeUsername,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.card_giftcard),
                                      labelText: "Cédula",
                                      hintText: "1850045376"));
                            }),
                        Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: Text("Ingresar la fecha de nacimiento",
                                style: Theme.of(context).textTheme.subtitle1)),
                        DatePickerWidget(
                            lastDate: DateTime.now(),
                            looping: false, // default is not looping
                            dateFormat: "dd-MMMM-yyyy",
                            locale: DatePicker.localeFromString('es'),
                            onChange: (DateTime newDate, _) {}),
                        DropdownButton<String>(
                            onChanged: (String? newValue) {
                              _roleSelected = newValue!;
                              setState(() {});
                            },
                            value: _roleSelected,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            underline: Container(height: 2),
                            items: _roles
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                        StreamBuilder<String>(builder: (context, snapshot) {
                          return TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: _signUpBloc.changeEmail,
                              decoration: InputDecoration(
                                  errorText: snapshot.error?.toString(),
                                  icon: const Icon(Icons.email),
                                  labelText: "Correo electrónico",
                                  hintText: "admin@trifasic.com"));
                        }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.passwordStream,
                            builder: (context, snapshot) {
                              return TextField(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: StreamBuilder<bool>(
                              stream: _signUpBloc.formSignUpStream,
                              builder: (context, snapshot) {
                                return ElevatedButton.icon(
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            User usr = User(
                                                displayname:
                                                    _signUpBloc.username,
                                                email: _signUpBloc.email,
                                                password: _signUpBloc.password);
                                            int result =
                                                await _usrServ.postUsuario(usr);
                                            if (result == 201) {
                                              Navigator.pop(context);
                                            }
                                          }
                                        : null,
                                    icon: const Icon(Icons.login),
                                    label: const Text("Ingresar"));
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
