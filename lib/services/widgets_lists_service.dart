import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/album.dart';
import 'package:flutter_jsonplaceholder/models/post.dart';
import 'package:flutter_jsonplaceholder/models/user.dart';
import 'package:flutter_jsonplaceholder/views/screens/user_screen.dart';
import 'package:flutter_jsonplaceholder/views/styling/jsonplaceholder_decorations.dart';
import 'package:flutter_jsonplaceholder/views/styling/jsonplaceholder_text_styles.dart';

class WidgetsListsService {
  static getUsersList(BuildContext context, List<User> users) {
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
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      UserScreen.routeName,
                      arguments: {'user': e},
                    );
                  },
                  icon: const Icon(Icons.read_more)),
            ],
          ),
        ),
      ),
    );
  }

  static getPostsList(BuildContext context, List<Post> posts) {
    List<Widget> postsList = List<Widget>.from(
      posts.sublist(0, 3).map(
            (e) => Container(
              // padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 5),
              // decoration: JsonplaceholderDecorations.usersElement,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title.toUpperCase(),
                    style: JsonplaceholderTextStyles.headerTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(e.body.split('\n')[0]),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.read_more),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
    );

    postsList.add(
      TextButton(
        onPressed: () {},
        child: const Text('All posts'),
      ),
    );

    return postsList;
  }

  static getAlbumsList(BuildContext context, List<Album> albums) {
    List<Widget> albumsList = List<Widget>.from(
      albums.sublist(0, 3).map(
            (e) => Container(
              // padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 5),
              // decoration: JsonplaceholderDecorations.usersElement,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title.toUpperCase(),
                    style: JsonplaceholderTextStyles.headerTextStyle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.read_more),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
    );

    albumsList.add(
      TextButton(
        onPressed: () {},
        child: const Text('All albums'),
      ),
    );

    return albumsList;
  }
}
