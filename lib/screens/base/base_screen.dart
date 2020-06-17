import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_by_hmb/blocs/drawer_bloc.dart';
import 'package:olx_by_hmb/common/custom_drawer/custom_drawer.dart';
import 'package:olx_by_hmb/screens/account/account_screen.dart';
import 'package:olx_by_hmb/screens/create/create_screen.dart';
import 'package:olx_by_hmb/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();

  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if (drawerBloc != _drawerBloc) {
      _drawerBloc = drawerBloc;

      _drawerSubscription?.cancel();
      _drawerSubscription = _drawerBloc.outPage.listen((page) {
        try {
          _pageController.jumpToPage(page);
        } catch (e) {}
      });
    }
  }

  @override
  void dispose() {
    _drawerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          CreateScreen(),
          Scaffold(
            appBar: AppBar(
              title: Text('Chat'),
            ),
            drawer: CustomDrawer(),
            backgroundColor: Colors.redAccent,
            body: Center(
              child: Text('chat'),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('Favoritos'),
            ),
            drawer: CustomDrawer(),
            backgroundColor: Colors.greenAccent,
            body: Center(
              child: Text('Favoritos'),
            ),
          ),
          AccountScreen(),
        ],
      ),
    );
  }
}
