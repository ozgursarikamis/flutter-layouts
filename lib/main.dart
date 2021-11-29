import 'package:flutter/material.dart';
import 'package:hello_layouts/art_util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NavApp',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Art TabBar'),
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.art_track), text: ArtUtil.caravaggio),
                  Tab(icon: Icon(Icons.art_track), text: ArtUtil.monet),
                  Tab(icon: Icon(Icons.art_track), text: ArtUtil.vanGogh)
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ArtUtil.img_caravaggio))),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ArtUtil.img_monet))),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ArtUtil.img_vangogh))),
                )
              ],
            ),
          ),
        ));
  }
}
