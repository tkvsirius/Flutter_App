import 'package:flutter/material.dart';

class MainDrower extends StatefulWidget {
  const MainDrower({
    Key? key,
  }) : super(key: key);

  @override
  _MainDrowerState createState() => _MainDrowerState();
}

class _MainDrowerState extends State<MainDrower> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: const <Widget>[
        Text(
          'Меню',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
