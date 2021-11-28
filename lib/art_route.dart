import 'package:flutter/material.dart';
import 'package:hello_layouts/art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  ArtRoute({required this.art});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'Choose your art',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  image: DecorationImage(
                      image: NetworkImage('https://bit.ly/fl_sky'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              title: const Text(ArtUtil.caravaggio),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.caravaggio),
            ),
            ListTile(
              title: const Text(ArtUtil.monet),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.monet),
            ),
            ListTile(
              title: const Text(ArtUtil.vanGogh),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.vanGogh),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Navigating art'),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.image),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList();
            },
            onSelected: (String value) => changeRoute(context, value),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(art), fit: BoxFit.cover)),
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image = '';
    switch (menuItem) {
      case ArtUtil.caravaggio:
        image = ArtUtil.img_caravaggio;
        break;
      case ArtUtil.monet:
        image = ArtUtil.img_monet;
        break;
      case ArtUtil.vanGogh:
        image = ArtUtil.img_vangogh;
        break;
      default:
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtRoute(art: image)));
  }
}
