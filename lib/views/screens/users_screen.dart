import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/user.dart';
import 'dart:async';

import 'package:flutter_jsonplaceholder/services/jsonplaceholder_service.dart';
import 'package:flutter_jsonplaceholder/views/styling/jsonplaceholder_decorations.dart';

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
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: FutureBuilder<List<User>>(
              future: futureUsers,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: getUsersList(snapshot.data!),
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

  getUsersList(List<User> users) {
    return List<Widget>.from(
      users.map(
        (e) => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: JsonplaceholderDecorations.usersElement,
          child: Column(
            children: [
              Text('Username: ${e.username}'),
              Text('Name: ${e.name}'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.read_more)),
            ],
          ),
        ),
      ),
    );
  }
}
