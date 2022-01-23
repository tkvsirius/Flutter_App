import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contract_1/themable.dart';

class MyAppBar extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  bool shouldFullyObstruct(BuildContext context) => true;

  @override
  Size get preferredSize {
    return const Size.fromHeight(
      60,
    );
  }
}

/// High AppBar
/// appBar Верхний
///
class _MyAppBarState extends State<MyAppBar> with Themeable {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.menu,
          color: colorByModeIndigoWhite(
            context,
          ),
        ),
      ),
      middle: Text(
        'Company',
        style: TextStyle(
          fontSize: 24,
          color: colorByModeIndigoWhite(context),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.account_circle_outlined,
          color: colorByModeIndigoWhite(
            context,
          ),
        ),
      ),
    );
  }
}
