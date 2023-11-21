import 'package:flutter/material.dart';
import 'package:test_app/About.dart';
import 'package:test_app/Apps.dart';
import 'package:test_app/Skills.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
      theme: ThemeData(
        primaryColor: Colors.black87,
        hintColor: Colors.black87,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
          subtitle2: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Portfolio",
            style: Theme.of(context).textTheme.headline6!,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.person, color: Colors.tealAccent),
                text: 'About',
              ),
              Tab(
                icon: Icon(Icons.star, color: Colors.tealAccent),
                text: 'Apps',
              ),
              Tab(
                icon:
                    Icon(Icons.apps_outage_outlined, color: Colors.tealAccent),
                text: 'Skills',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black54,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: UserAccountsDrawerHeader(
                    accountName: const Text(
                      "Md Tanbirul Haq",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    accountEmail: const Text(
                      "tanbirul15-3940@diu.edu.bd",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/327052462_1209798876295249_760955304928906239_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEKxVgQXOFSbMoOCfbX9IzoAH05Zx1uwGUAfTlnHW7AZXjRnn6vOu8jJckBduQ9tu7p-qU3RVgbMlHFahWOSTPh&_nc_ohc=cvIvpygNBnoAX_CNSTk&_nc_ht=scontent.fdac8-1.fna&oh=00_AfDk-NWB6jTolL86jyujszezCj3B9Co7LCPOLkXG1doLjg&oe=655F2F46",
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    //Home
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    //settings
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Gmail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    //Gmail
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.contact_emergency,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    //Contact
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    //Facebook
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.tealAccent,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            About(),
            Apps(),
            Skills(),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
