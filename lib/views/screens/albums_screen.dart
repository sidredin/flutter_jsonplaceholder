import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/album.dart';

import 'package:flutter_jsonplaceholder/services/widgets_lists_service.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);
  static const String routeName = 'albums';

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late final List<Album> albums;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    albums = args['albums'];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All albums',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('All albums'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ListView(
              children: WidgetsListsService.getAlbumsList(context, albums),
            ),
          ),
        ),
      ),
    );
  }
}
