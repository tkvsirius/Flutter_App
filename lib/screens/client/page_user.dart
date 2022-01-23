// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contract_1/themable.dart';
import 'package:flutter_contract_1/widgets/widget_app_bar.dart';

class PageUserScreen extends StatefulWidget {
  const PageUserScreen({Key? key}) : super(key: key);

  @override
  _PageUserScreenState createState() => _PageUserScreenState();
}

enum _TabBarState {
  PAGE_1,

  PAGE_2,

  PAGE_3,
}

class _PageUserScreenState extends State<PageUserScreen> with Themeable {
  // Текущий выбранный Таб
  _TabBarState _tabBarState = _TabBarState.PAGE_1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorByMode(context),
      appBar: const MyAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildValueProducts(context),
            const SizedBox(
              height: 12,
            ),
            if (_tabBarState == _TabBarState.PAGE_1) _buildPage_1(context),
            if (_tabBarState == _TabBarState.PAGE_2) _buildPage_2(context),
            if (_tabBarState == _TabBarState.PAGE_3) _buildPage_3(context),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Построение выбора меню в основной вкладе
  ///
  Padding _buildValueProducts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl<_TabBarState>(
          backgroundColor: colorByModeGrey(context),
          thumbColor: colorByModeGrey2(context),
          groupValue: _tabBarState,
          children: {
            _TabBarState.PAGE_1: buildSegment(
              context,
              'Cтраницa 1',
            ),
            _TabBarState.PAGE_2: buildSegment(
              context,
              'Cтраница 2',
            ),
            _TabBarState.PAGE_3: buildSegment(
              context,
              'Cтраница 3',
            ),
          },
          onValueChanged: (groupValue) {
            print(groupValue);
            setState(() => this._tabBarState = groupValue!);
          },
        ),
      ),
    );
  }

  ///
  /// Построение Страницы 1
  ///
  Widget _buildPage_1(BuildContext context) {
    return Text(
      'Страница',
      style: TextStyle(
        fontSize: 20,
        color: colorByModeIndigoWhite(context),
      ),
    );
  }

  ///
  /// Построение Страницы 2
  ///
  Widget _buildPage_2(BuildContext context) {
    return Text(
      'Страница 2',
      style: TextStyle(
        fontSize: 20,
        color: colorByModeIndigoWhite(context),
      ),
    );
  }

  ///
  /// Построение Страницы 3
  ///
  Widget _buildPage_3(BuildContext context) {
    return Text(
      'Страница 3',
      style: TextStyle(
        fontSize: 20,
        color: colorByModeIndigoWhite(context),
      ),
    );
  }

  ///
  /// Построение вкладок
  ///
  Widget buildSegment(BuildContext context, String text) => Container(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: colorByModeReverse(context),
          ),
        ),
      );
}
