import 'package:data_on_test/homepage.dart';
import 'package:data_on_test/providers/university_provider.dart';
import 'package:data_on_test/screens/home/home_screen.dart';
import 'package:data_on_test/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UniversityResultProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DataOn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            // pertama kali diakses ketika buka apps
            case '/':
              return MaterialPageRoute(
                // ubah disini apabila ingin pindah ke testWidget/HomePage
                // builder: (BuildContext context) => const TestWidget(),
                builder: (BuildContext context) => const LoginScreen(),
                settings: settings,
              );

            // test menu
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (BuildContext context) => const HomePage(),
                settings: settings,
              );
          }
        },
      ),
    );
  }
}
