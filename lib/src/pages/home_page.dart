import 'package:fixhome/src/utils/main_menu.dart';
import 'package:fixhome/src/widgets/location_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;
  // ignore: unused_field
  final PageStorageBucket _bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: const Drawer(),
          body: homeWidgets[currentTab],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              currentTab = index;
              setState(() {});
            },
            currentIndex: currentTab,
            type: BottomNavigationBarType.fixed,
            items: menuOptions
                .map((e) =>
                    BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
                .toList(),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.map_sharp),
            backgroundColor: Colors.cyan,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LocationWidget(),
                ),
              );
            },
          )),
    );
  }
}
