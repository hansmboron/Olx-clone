import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/drawer_bloc.dart';
import 'blocs/home_bloc.dart';
import 'screens/base/base_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        title: 'XLO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale('pt', 'BR')],
        home: BaseScreen(),
      ),
    );
  }
}
