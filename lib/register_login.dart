import 'package:dex_pr/enter.dart';
import 'package:dex_pr/register.dart';
import 'package:dex_pr/theme/color_collection.dart';
import 'package:dex_pr/theme/svg_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
          backgroundColor: Color(0xFFFFF8F9),
          leading: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 14.0, right: 14.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/loading');
                              },
                              icon: SvgPicture.asset(
                                  'assets/svg/left-arrow.svg')),
                          Container(
                            color: Color(0xFFFFF8F9),
                            padding: EdgeInsets.only(left: 4.0, right: 6.0),
                            height: 21,
                            width: 240,
                          ),
                          SvgPicture.asset('assets/svg/language.svg'),
                        ],
                      ))
                ],
              ),
            ],
          )),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFFFFF8F9),
          body: Column(children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'Вход',
                ),
                Tab(
                  text: 'Регистрация',
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
