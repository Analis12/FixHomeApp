import 'package:fixhome/src/providers/main_provider.dart';
// ignore: unused_import
import 'package:fixhome/src/theme/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    Map<String, dynamic> content = JwtDecoder.decode(mainProvider.token);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: const Text(
        "FIXHOME - Ajustes",
        style: cardtitleStyle,
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
                child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      content["name"],
                      style: StyleSettings,
                    ),
                    subtitle: const Text("Nombre", style: StyleSettings))),
            Card(
                child: ListTile(
                    leading: const Icon(Icons.computer),
                    title: Text(content["role"].toString().toUpperCase(),
                        style: StyleSettings),
                    subtitle: const Text("Rol", style: StyleSettings))),
            Card(
                child: ListTile(
                    leading: const Icon(Icons.important_devices),
                    title: Text(content["user_id"], style: StyleSettings),
                    subtitle: const Text("Id", style: StyleSettings))),
            Card(
                child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(content["email"], style: StyleSettings),
                    subtitle: const Text("Correo electrónico",
                        style: StyleSettings))),
            const SettingMode(),
            Card(
                child: ListTile(
              trailing: IconButton(
                  onPressed: () {
                    mainProvider.token = "";
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.logout)),
              title: Text(
                "Salir",
                style: StyleSettings,
              ),
            )),
          ],
        ),
      ),
    ));
  }
}

class SettingMode extends StatelessWidget {
  const SettingMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Card(
        child: ListTile(
      leading: const Icon(Icons.light_mode),
      title: const Text("Modo claro", style: StyleSettings),
      subtitle: const Text("Habilitar / Deshabilitar modo claro",
          style: StyleSettings),
      trailing: Switch(
          value: mainProvider.mode,
          onChanged: (bool value) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool("mode", value);
            mainProvider.mode = value;
          }),
    ));
  }
}
