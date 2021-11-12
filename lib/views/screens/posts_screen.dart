import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post.dart';

import 'package:flutter_jsonplaceholder/services/widgets_lists_service.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);
  static const String routeName = 'posts';

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late final List<Post> posts;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    posts = args['posts'];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('All posts'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ListView(
              children: WidgetsListsService.getPostsList(context, posts),
            ),
          ),
        ),
      ),
    );
  }
}
