import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/ui/settings/settings.dart';
import 'notification/notification.dart';

import 'cart/cart.dart';

import 'home/home.dart';

const int homeIndex = 0;
const int cartIndex = 1;
const int profileIndex = 2;
const int notifactionIndex = 3;

class RootScrean extends StatefulWidget {
  const RootScrean({super.key});

  @override
  State<RootScrean> createState() => _RootScreanState();
}

class _RootScreanState extends State<RootScrean> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  final GlobalKey<NavigatorState> _notifactionKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    cartIndex: _cartKey,
    profileIndex: _profileKey,
    notifactionIndex: _notifactionKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_homeKey, homeIndex, const HomeScrean()),
              _navigator(_cartKey, cartIndex, const CartScren()),
              _navigator(_profileKey, profileIndex, const SettingsScren()),
              _navigator(
                  _notifactionKey, notifactionIndex, const NotificationScren()),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              showSelectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              selectedLabelStyle: const TextStyle(fontSize: 14),
              selectedItemColor: Theme.of(context).colorScheme.primary,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings), label: "Settings"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.location_north_fill),
                    label: "Notification"),
              ],
              currentIndex: selectedScreenIndex,
              onTap: (selectIndex) {
                setState(() {
                  selectedScreenIndex = selectIndex;
                });
              },
            ),
          )),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)));
  }
}
