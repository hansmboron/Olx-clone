import 'package:flutter/material.dart';
import 'package:olx_by_hmb/blocks/drawer-block.dart';
import 'package:olx_by_hmb/components/drawer-icons.dart';
import 'package:provider/provider.dart';

class DrawerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerBlock _drawerBloc = Provider.of<DrawerBlock>(context);

    void _setPage(int page) {
      Navigator.of(context).pop();
      _drawerBloc.setPage(page);
    }

    return StreamBuilder<int>(
        stream: _drawerBloc.outPage,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              IconTile(
                highlighted: snapshot.data == 0,
                iconData: Icons.list,
                label: 'Anúncios',
                onTap: () {
                  _setPage(0);
                },
              ),
              IconTile(
                highlighted: snapshot.data == 1,
                iconData: Icons.add_box,
                label: 'Inserir Anúncio',
                onTap: () {
                  _setPage(1);
                },
              ),
              IconTile(
                highlighted: snapshot.data == 2,
                iconData: Icons.chat,
                label: 'Chat',
                onTap: () {
                  _setPage(2);
                },
              ),
              IconTile(
                highlighted: snapshot.data == 3,
                iconData: Icons.favorite,
                label: 'Favoritos',
                onTap: () {
                  _setPage(3);
                },
              ),
              IconTile(
                highlighted: snapshot.data == 4,
                iconData: Icons.account_box,
                label: 'Minha conta',
                onTap: () {
                  _setPage(4);
                },
              ),
            ],
          );
        });
  }
}
