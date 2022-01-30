import 'package:fixhome/src/pages/home_page.dart';
import 'package:fixhome/src/pages/login_page.dart';
import 'package:fixhome/src/pages/signup_page.dart';
import 'package:fixhome/src/providers/main_provider.dart';
import 'package:fixhome/src/theme/app_theme.dart';
import 'package:fixhome/src/widgets/add_establishment_widget.dart';
import 'package:fixhome/src/widgets/services_home_widget.dart';
import 'package:fixhome/src/widgets/settings_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return FutureBuilder<bool>(
        future: mainProvider.initPrefs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.square(
                dimension: 150.0, child: Text("Ha ocurrido un error"));
          }

          if (snapshot.hasData) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: AppTheme.themeData(mainProvider.mode),
                routes: {
                  "*/login": (context) => const LoginPage(),
                  "/settings": (context) => const SettingsWidget(),
                  "/singup": (context) => const SignUpPage(),
                },
                //initialRoute: "/login",
                home: const MyHomePage(),
              ),
            );
          }

          return const SizedBox.square(
              dimension: 50.0, child: CircularProgressIndicator());
        });
  }
}
