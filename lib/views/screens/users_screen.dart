import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/user.dart';
import 'dart:async';

import 'package:flutter_jsonplaceholder/services/jsonplaceholder_service.dart';
import 'package:flutter_jsonplaceholder/services/widgets_lists_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);
  static const String routeName = 'users';

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = JsonplaceholderService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: FutureBuilder<List<User>>(
              future: futureUsers,
              builder: (builderContext, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: WidgetsListsService.getUsersList(
                      context,
                      snapshot.data!,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
