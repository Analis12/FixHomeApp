import 'package:fishome/src/models/establishment_model.dart';
import 'package:fishome/src/pages/carpinter_page.dart';
import 'package:fishome/src/theme/constant_values.dart';
import 'package:fishome/src/utils/main_menu.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('NUESTROS SERVICIOS', style: headerStyle),
        actions: const [],
        centerTitle: true,
        elevation: 4,
        toolbarHeight: 80,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                      children: servicios
                          .map((e) => Card(
                              shape: roundedRectangle12,
                              margin: const EdgeInsets.all(10),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 5.0,
                              child: SizedBox(
                                  height: 72.3,
                                  child: ListTile(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const EstablecimientoWidget(),
                                        ),
                                      );
                                    },
                                    title: Text(e.title, style: titleStyle),
                                    leading: SizedBox(
                                      child: Image.asset(e.image),
                                    ),
                                  ))))
                          .toList()))
            ],
          ),
        ),
      ),
    ));
  }
}
