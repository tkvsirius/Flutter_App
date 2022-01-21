import 'package:flutter/cupertino.dart';
import 'package:flutter_contract_1/themable.dart';
import 'package:flutter_contract_1/widgets/widget_app_bar.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  _DesignScreenState createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> with Themeable {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const MyAppBar(),
      child: Container(),
    );
  }
}
