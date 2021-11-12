import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/album.dart';
import 'package:flutter_jsonplaceholder/models/post.dart';
import 'package:flutter_jsonplaceholder/models/user.dart';
import 'dart:async';

import 'package:flutter_jsonplaceholder/services/jsonplaceholder_service.dart';
import 'package:flutter_jsonplaceholder/services/widgets_lists_service.dart';
import 'package:flutter_jsonplaceholder/views/screens/albums_screen.dart';
import 'package:flutter_jsonplaceholder/views/screens/posts_screen.dart';
import 'package:flutter_jsonplaceholder/views/styling/jsonplaceholder_text_styles.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  static const String routeName = 'user';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<Post>> futurePosts;
  late Future<List<Album>> futureAlbums;
  late final User user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    user = args['user'];
    futurePosts = JsonplaceholderService.fetchUserPosts(user.id);
    futureAlbums = JsonplaceholderService.fetchUserAlbums(user.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: user.username,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.username),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Text('Name: ${user.name}'),
              Text('Email: ${user.email}'),
              Text('phone: ${user.phone}'),
              Text('website: ${user.website}'),
              Text('Adress: ${user.address.zipcode}, ${user.address.city}, '
                  '${user.address.street}, ${user.address.suite}'),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Company:',
                style: JsonplaceholderTextStyles.headerTextStyle,
              ),
              Text('BS: ${user.company.name}'),
              Text('BS: ${user.company.bs}'),
              Row(
                children: [
                  const Text('Catch phrase: "'),
                  Text(
                    '${user.company.catchPhrase}"',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Posts:',
                style: JsonplaceholderTextStyles.headerTextStyle,
              ),
              FutureBuilder<List<Post>>(
                future: futurePosts,
                builder: (builderContext, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> postsWidgetsList =
                        WidgetsListsService.getPostsList(
                      context,
                      snapshot.data!.sublist(0, 3),
                    );
                    postsWidgetsList.add(
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            PostsScreen.routeName,
                            arguments: {'posts': snapshot.data!},
                          );
                        },
                        child: const Text('All posts'),
                      ),
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: postsWidgetsList,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              const Text(
                'Albums:',
                style: JsonplaceholderTextStyles.headerTextStyle,
              ),
              FutureBuilder<List<Album>>(
                future: futureAlbums,
                builder: (builderContext, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> albumsWidgetsList =
                        WidgetsListsService.getAlbumsList(
                      context,
                      snapshot.data!.sublist(0, 3),
                    );
                    albumsWidgetsList.add(
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AlbumsScreen.routeName,
                            arguments: {'albums': snapshot.data!},
                          );
                        },
                        child: const Text('All albums'),
                      ),
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: albumsWidgetsList,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
