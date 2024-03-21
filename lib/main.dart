import 'dart:async';

import 'package:dex_pr/generated/l10n.dart';
import 'package:dex_pr/register_login.dart';
import 'package:dex_pr/router.dart';
import 'package:dex_pr/theme/color_collection.dart';
import 'package:dex_pr/theme/svg_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dex_pr/router.dart';
void main() {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('ru'),
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: ColorCollection.primary,
          onPrimary: ColorCollection.onPrimary,
          secondary: ColorCollection.secondary,
          onSecondary: ColorCollection.onSecondary,
          error: ColorCollection.error,
          onError: ColorCollection.onError,
          background: ColorCollection.background,
          onBackground: ColorCollection.onBackground,
          surface: ColorCollection.surface,
          onSurface: ColorCollection.onSurface,
          brightness: ColorCollection.brightness,
        ),
        useMaterial3: true,
      ),

    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      context.push('/autorise');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.onPrimary,
      body: Center(
        child: Column(children: [
          Container(
            height: 250,
          ),
          SvgPicture.asset(
            ('assets/svg/logo.svg'),width: 90,height: 90,
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: CircularProgressIndicator(
            )
          ),
        ]),
      ),
    );
  }
}
