import 'package:flutter/material.dart';
import 'package:findmind/views/home.dart';

// ignore: must_be_immutable
class MyDetailPage extends StatefulWidget {
  MySuperHero _superHero;

  MyDetailPage(MySuperHero superHero) {
    _superHero = superHero;
  }

  @override
  _MyDetailPageState createState() => _MyDetailPageState(_superHero);
}

class _MyDetailPageState extends State<MyDetailPage> {
  MySuperHero superHero;

  _MyDetailPageState(MySuperHero superHero) {
    this.superHero = superHero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(superHero.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Hero(
              transitionOnUserGestures: true,
              tag: superHero,
              child: Transform.scale(
                scale: 2.0,
                child: Image.network(
                  superHero.img,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.blue[200],
              margin: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(superHero.body),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Buy this Product"),
            ),
          ],
        ),
      ),
    );
  }
}
