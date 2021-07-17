import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);
  Column LayoutCnt() {
    return Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
          child: Text(
            'Contact Me',
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
      SizedBox(
          width: 300,
          child: Divider(
            color: Colors.white,
          )),
      Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.account_circle, color: Colors.grey[700]),
              SizedBox(
                width: 20,
              ),
              Text(
                'Hossein Rahmati',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListTile(
            title: Text('Rahmatei@gmail.com'),
            leading: Icon(
              Icons.email,
              color: Colors.grey[700],
            ),
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutCnt();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numberLeft = 1;
  int numberRight = 1;
  void SetRandomDice() {
    setState(() {
      numberLeft = Random.secure().nextInt(6) + 1;
      numberRight = Random.secure().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: SafeArea(
            child: Scaffold(
      backgroundColor: Colors.red[500],
      appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text(
            'Dicee App',
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: Text('Dice',
                    style: TextStyle(fontSize: 70, color: Colors.white))),
            SizedBox(
                width: 300,
                child: Divider(
                  color: Colors.white,
                )),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        SetRandomDice();
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(10, 20, 10, 0))),
                      child: (Image.asset('Images/dice$numberLeft.png'))),
                ),
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            SetRandomDice();
                          });
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.fromLTRB(10, 20, 10, 0))),
                        child: (Image.asset('Images/dice$numberRight.png')))),
              ],
            ),
            Contact()
          ],
        ),
      ),
    ))));
  }
}
