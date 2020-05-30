import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olx_by_hmb/blocks/drawer-block.dart';
import 'package:olx_by_hmb/blocks/home-bloc.dart';
import 'package:olx_by_hmb/components/custom-drawer.dart';
import 'package:olx_by_hmb/components/search-dialog.dart';
import 'package:olx_by_hmb/pages/home-page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageCtrl = PageController();

  DrawerBlock _drawerBlock;
  HomeBloc _homeBloc;
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

    final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
    if (homeBloc != _homeBloc) {
      _homeBloc = homeBloc;
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
    _openSearch(String currentSearch) async {
      final String search = await showDialog(
        context: context,
        builder: (context) => SearchDialog(currentSearch: currentSearch),
      );
      if (search != null) {
        _homeBloc.setSearch(search);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: _homeBloc.outSearch,
          initialData: '',
          builder: (context, snapshot) {
            if (snapshot.data.isEmpty) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () => _openSearch(snapshot.data),
                child: LayoutBuilder(
                  builder: (context, constraits) {
                    return Container(
                      child: Text(snapshot.data),
                      width: constraits.biggest.width,
                    );
                  },
                ),
              );
            }
          },
        ),
        actions: <Widget>[
          StreamBuilder<String>(
            stream: _homeBloc.outSearch,
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _openSearch('');
                    });
              } else {
                return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      _homeBloc.setSearch('');
                    });
              }
            },
          )
        ],
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
