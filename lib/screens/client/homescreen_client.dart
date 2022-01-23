import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contract_1/screens/client/business_screen.dart';
import 'package:flutter_contract_1/screens/client/page_user.dart';
import 'package:flutter_contract_1/screens/client/list_users.dart';
import 'package:flutter_contract_1/themable.dart';

class HomeScreenClient extends StatelessWidget with Themeable {
  /// Контроллер для работы с табами
  final CupertinoTabController _tabController = CupertinoTabController();

  /// Ключи навигации
  final List<GlobalKey<NavigatorState>> _tabNavKeys =
      List<GlobalKey<NavigatorState>>.generate(3, (int index) {
    return GlobalKey<NavigatorState>();
  });

  HomeScreenClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: _buildTabBar(context),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            navigatorKey: _tabNavKeys[index],
            builder: (BuildContext context) {
              late Widget child;

              switch (index) {
                case 0:
                  child = const ListUsersScreen();
                  break;

                case 1:
                  child = const PageUserScreen();
                  break;

                case 2:
                  child = const BisnessScreen();
                  break;
              }

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: child,
              );
            },
          );
        },
      );

  /// Lower TabBar
  /// Нижний Таб Бар
  ///
  CupertinoTabBar _buildTabBar(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: _tabController.index,
      backgroundColor:
          CupertinoTheme.of(context).primaryContrastingColor.withOpacity(0.3),
      activeColor: colorByModeIndigoWhite(context),
      // inactiveColor: colorByModeReverse(context),
      onTap: (index) {
        print('Clicked Tab $index');
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: CupertinoTheme.of(context)
              .primaryContrastingColor
              .withOpacity(0.3),
          title: const Text(
            'List Users',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          icon: const Icon(
            CupertinoIcons.square_list,
          ),
        ),
        const BottomNavigationBarItem(
          title: Text(
            'Page User',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          icon: Icon(
            CupertinoIcons.person_2_alt,
          ),
        ),
        const BottomNavigationBarItem(
          title: Text(
            'Business',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          icon: Icon(
            Icons.accessibility_new,
          ),
        ),
      ],
    );
  }
}
