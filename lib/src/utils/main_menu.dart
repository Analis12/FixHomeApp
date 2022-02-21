import 'package:fixhome/src/widgets/add_establishment_widget.dart';
import 'package:fixhome/src/widgets/services_home_widget.dart';
import 'package:fixhome/src/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.settings, "Ajustes"),
];

class ServiceMenu {
  String title;
  String image;
  String tipo;
  ServiceMenu(this.image, this.title, this.tipo);
}

List<ServiceMenu> servicios = [
  ServiceMenu("assets/images/carpinteria.PNG", "CARPINTERIA", "1"),
  ServiceMenu("assets/images/albañil.PNG", "ALBAÑILERIA", "2"),
  ServiceMenu("assets/images/cerrajeria.PNG", "CERRAJERIA", "3"),
  ServiceMenu("assets/images/electricidad.PNG", "ELECTRICIDAD", "4"),
  ServiceMenu("assets/images/jardineria.PNG", "JARDINERIA", "5"),
  ServiceMenu("assets/images/electrodomestico.png",
      "REPARACION ELECTRODOMESTICOS", "6"),
];

List<Widget> homeWidgets = [const HomePageWidget(), const SettingsWidget()];
