import 'package:fixhome/src/pages/albanil_page.dart';
import 'package:fixhome/src/pages/carpinter_page.dart';
import 'package:fixhome/src/pages/cerrajeria_page.dart';
import 'package:fixhome/src/pages/electricidad_page.dart';
import 'package:fixhome/src/pages/electrodomesticos_page.dart';
import 'package:fixhome/src/pages/jardineria_page.dart';
import 'package:fixhome/src/theme/constant_values.dart';
import 'package:fixhome/src/utils/main_menu.dart';
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
        title: const Text('NUESTROS SERVICIOS', style: headerStyle),
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
                                      if (e.tipo == "1") {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EstablecimientoWidget(),
                                          ),
                                        );
                                      } else {
                                        if (e.tipo == "2") {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const EstablecimientoAlbanil(),
                                            ),
                                          );
                                        } else {
                                          if (e.tipo == "3") {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const EstablecimientoCerrajeria(),
                                              ),
                                            );
                                          } else {
                                            if (e.tipo == "4") {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EstablecimientoElectricidad(),
                                                ),
                                              );
                                            } else {
                                              if (e.tipo == "5") {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const EstablecimientoJardineria(),
                                                  ),
                                                );
                                              } else {
                                                if (e.tipo == "6") {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const EstablecimientoElectrodomestico(),
                                                    ),
                                                  );
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    },
                                    title: Text(e.title, style: headerStyle),
                                    leading: SizedBox(
                                      child: Image.asset(
                                        e.image,
                                        width: 130,
                                        height: 130,
                                      ),
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
