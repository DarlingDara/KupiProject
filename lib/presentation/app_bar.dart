import 'package:dex_pr/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dex_pr/core/domain/intl/generated/l10n.dart';

class RegisterAppBar extends AppBar {
  final String title1;
  RegisterAppBar({
    Key? key,
    required this.title1,
    required BuildContext context,
  }) : super(
      backgroundColor: Color(0xFFFFF8F9),

      leading: IconButton(
        onPressed: () => context.go('/autorise'),
        icon: SvgPicture.asset(
            'assets/svg/left-arrow.svg'),
        iconSize: 24,),
      title: Text(title1, style: TextStyle(fontSize: 22),),
      actions: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 14.0, right: 14.0),
                    child: Row(
                      children: [

                        SvgPicture.asset('assets/svg/language.svg'),
                      ],
                    ))
              ],
            ),
          ],
        )
      ]
  );

}