import 'package:contact/pages/contact_list.dart';
import 'package:contact/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../auth/auth_prefs.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';

  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    getLoginStatus().then((value) {
      if(value) {
        Navigator.pushReplacementNamed(context, ContactList.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
