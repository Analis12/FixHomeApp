import 'package:fixhome/src/providers/main_provider.dart';
import 'package:fixhome/src/theme/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ajustes",
            style: headerStyle,
          ),
          centerTitle: true,
        ),
        body: ListTile(
          title: const Text(
            "Modo Oscuro",
            style: titleStyle,
          ),
          trailing: Switch(
              value: mainProvider.mode,
              onChanged: (bool value) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("mode", value);
                mainProvider.mode = value;
              }),
        ),
      ),
    );
  }
}
