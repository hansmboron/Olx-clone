import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olx_by_hmb/blocks/drawer-block.dart';
import 'package:olx_by_hmb/components/custom-drawer.dart';
import 'package:olx_by_hmb/pages/home-page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageCtrl = PageController();

  DrawerBlock _drawerBlock;
  StreamSubscription _drawersubscription;

  @override
  void didChangeDependencies() {
    final DrawerBlock drawerBlock = Provider.of<DrawerBlock>(context);
    if (drawerBlock != _drawerBlock) {
      _drawerBlock = drawerBlock;
      _drawersubscription?.cancel();
      _drawerBlock.outPage.listen((page) {
        _pageCtrl.jumpToPage(page);
      });
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _drawersubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLX Clone - by hmb'),
      ),
      body: PageView(
        controller: _pageCtrl,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.indigo,
          ),
          Container(
            color: Colors.lime,
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
