import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_proj/screens/my_drawer_header.dart';
import 'package:flutter_proj/screens/settings.dart';
import 'package:flutter_proj/screens/signin_screen.dart';
//import 'package:flutter_proj/screens/signup_screen.dart';

import '../utils/color_utils.dart';
import 'Leaderboard.dart';
import 'dashboard.dart';
import 'Games.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.Leaderboard) {
      container = LeaderboardPage();
    } else if (currentPage == DrawerSections.Games) {
      container = GamesPage();
    } else if (currentPage == DrawerSections.signin_screen) {
      container = SignInScreen();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    }
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 28, 127, 232),
        title: Text("Physioplay"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 33, 150, 243),
                  Color(0xFF059362)
                ]),
          ),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Leaderboard", Icons.people_alt_outlined,
              currentPage == DrawerSections.Leaderboard ? true : false),
          menuItem(3, "Games", Icons.games_outlined,
              currentPage == DrawerSections.Games ? true : false),
          Divider(),
          menuItem(4, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(5, "Logout", Icons.logout_outlined,
              currentPage == DrawerSections.signin_screen ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.Leaderboard;
            } else if (id == 3) {
              currentPage = DrawerSections.Games;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            } else if (id == 5) {
              currentPage = DrawerSections.signin_screen;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  Leaderboard,
  Games,
  settings,
  signin_screen,
}
