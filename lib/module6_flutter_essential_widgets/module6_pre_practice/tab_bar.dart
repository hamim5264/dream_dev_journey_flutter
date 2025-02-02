import 'package:flutter/material.dart';
import 'Fragments//home_fragment.dart';
import 'Fragments/alarm_fragment.dart';
import 'Fragments/call_fragment.dart';
import 'Fragments/contact_fragment.dart';
import 'Fragments/email_fragment.dart';
import 'Fragments/mode_fragment.dart';
import 'Fragments/search_fragment.dart';
import 'Fragments/settings_fragment.dart';

void main() {
  runApp(
    TabBarApp(),
  );
}

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TapBarActivity(),
      debugShowCheckedModeBanner: true,
      title: "Tab Bar Details",
    );
  }
}

class TapBarActivity extends StatelessWidget {
  const TapBarActivity({super.key});

  /// Custom Toast Message
  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text(
            "TabBar App",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            isScrollable: true,
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                ),
                text: "Home",
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                text: "Search",
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                text: "Settings",
              ),
              Tab(
                icon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                text: "Email",
              ),
              Tab(
                icon: Icon(
                  Icons.contact_phone,
                  color: Colors.black,
                ),
                text: "Contact",
              ),
              Tab(
                icon: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                text: "Call",
              ),
              Tab(
                icon: Icon(
                  Icons.alarm,
                  color: Colors.black,
                ),
                text: "Alarm",
              ),
              Tab(
                icon: Icon(
                  Icons.mode_night,
                  color: Colors.black,
                ),
                text: "Mode",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeFragment(),
            SearchFragment(),
            SettingsFragment(),
            EmailFragment(),
            ContactFragment(),
            CallFragment(),
            AlarmFragment(),
            ModeFragment(),
          ],
        ),
      ),
    );
  }
}
