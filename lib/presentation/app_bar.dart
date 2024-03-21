import 'package:dex_pr/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dex_pr/generated/l10n.dart';

class RegisterAppBar extends AppBar {
  RegisterAppBar({
    Key? key,
    required BuildContext context,
  }) : super(
      backgroundColor: Color(0xFFFFF8F9),

      leading: IconButton(
        onPressed: () => context.go('/'),
        icon: SvgPicture.asset(
            'assets/svg/left-arrow.svg'),
        iconSize: 24,),
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