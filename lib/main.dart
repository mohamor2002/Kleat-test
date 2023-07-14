import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: HomePage()));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      drawer: Drawer(),
      body: CardSlider(),
    ));
  }
}

class CardSlider extends StatefulWidget {
  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  List<String> cardText = ['hello', 'Hola!', 'hh'];
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => setState(() {
              color = color == Colors.white70 ? Colors.amber : Colors.white70;
            }),
        child: Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardText.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCard(cardText[index], color);
            },
          ),
        ));
  }
}

Widget buildCard(String cardInfo, Color color) {
  return Container(
      width: 200,
      child: Card(
        child: Center(
            child: Text(
          cardInfo,
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )),
        color: color,
      ));
}
