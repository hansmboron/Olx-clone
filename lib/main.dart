import 'package:flutter/material.dart';
import 'package:olx_by_hmb/blocks/drawer-block.dart';
import 'package:olx_by_hmb/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBlock>(
          create: (_) => DrawerBlock(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OLX Clone - by hmb',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
