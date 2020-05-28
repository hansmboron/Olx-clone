import 'package:flutter/material.dart';
import 'package:olx_by_hmb/components/custom-header.dart';
import 'package:olx_by_hmb/components/drawer-body.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomHeader(),
          DrawerBody(),
          Divider(),
        ],
      ),
    );
  }
}
