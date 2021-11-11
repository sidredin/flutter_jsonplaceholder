import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/views/screens/user_screen.dart';
import 'package:flutter_jsonplaceholder/views/screens/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jsonplaceholder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: UsersScreen.routeName,
      routes: {
        UsersScreen.routeName: (context) => const UsersScreen(),
        UserScreen.routeName: (context) => const UserScreen(),
      },
    );
  }
}
