import 'package:data_on_test/screens/feature/feature_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './screens/home/home_screen.dart';
import './screens/profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBtmNavBar = 1;

  void _navigateBotBar(int index) {
    setState(() {
      _selectedBtmNavBar = index;
    });
  }

  final List<Widget> _pageBtmNavBar = [
    const FeatureScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: _pageBtmNavBar[_selectedBtmNavBar],
      bottomNavigationBar: MediaQuery(
        // MediaQuery untuk menambahkan tinggi pada bottomNavbar
        data: const MediaQueryData(
          padding: EdgeInsets.only(bottom: 10, top: 10),
        ),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset(0, -0.5), blurRadius: 1)
          ]),
          child: BottomNavigationBar(
            currentIndex: _selectedBtmNavBar,
            onTap: _navigateBotBar,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: FaIcon(FontAwesomeIcons.newspaper),
                ),
                label: 'Feature',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: FaIcon(FontAwesomeIcons.house),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: FaIcon(FontAwesomeIcons.github, size: 20),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
