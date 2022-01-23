import 'package:flutter/cupertino.dart';
import 'package:flutter_contract_1/themable.dart';
import 'package:flutter_contract_1/widgets/widget_app_bar.dart';

class BisnessScreen extends StatefulWidget {
  const BisnessScreen({Key? key}) : super(key: key);

  @override
  _BisnessScreenState createState() => _BisnessScreenState();
}

class _BisnessScreenState extends State<BisnessScreen> with Themeable {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const MyAppBar(),
      child: Container(),
    );
  }
}
