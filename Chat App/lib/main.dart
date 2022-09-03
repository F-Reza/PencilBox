
import 'package:chat_app/pages/chat_room_page.dart';
import 'package:chat_app/pages/launcher_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/profile_page.dart';
import 'package:chat_app/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp()));
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAzMaqdEoHLJ4UFw2Ss00mkfnO1F9XvWvg",
            authDomain: "agenda-cilios.firebaseapp.com",
            projectId: "agenda-cilios",
            storageBucket: "agenda-cilios.appspot.com",
            messagingSenderId: "87881805797",
            appId: "1:87881805797:web:cd3902820e5db40cda090c",
            measurementId: "G-JMXWE37BPX")
    );
  }else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName : (_) => LauncherPage(),
        LoginPage.routeName : (_) => LoginPage(),
        ProfilePage.routeName : (_) => ProfilePage(),
        ChatRoomPage.routeName : (_) => ChatRoomPage(),
      },
    );
  }
}

