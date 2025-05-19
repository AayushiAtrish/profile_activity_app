import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => ProfilePage(),
        '/editProfile': (context) => EditProfilePage(),
      },
    );
  }
}
