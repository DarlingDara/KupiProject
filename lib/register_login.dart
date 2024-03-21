import 'package:dex_pr/enter.dart';
import 'package:dex_pr/presentation/app_bar.dart';
import 'package:dex_pr/register.dart';
import 'package:dex_pr/theme/color_collection.dart';
import 'package:dex_pr/theme/svg_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dex_pr/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class EntryRegister extends StatefulWidget {
  const EntryRegister({Key? key}) : super(key: key);

  @override
  _EntryRegister createState() => _EntryRegister();
}

class _EntryRegister extends State<EntryRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.onPrimary,
      appBar: RegisterAppBar(context: context,),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFFFFF8F9),
          body: Column(children: [
            TabBar(
              tabs: [
                Tab(
                  text: S.of(context).enter,
                ),
                Tab(
                  text: S.of(context).registration,
                )
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  child: Center(
                    child: Enter(),
                  ),
                ),
                Container(
                  child: Center(child: Register()),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
