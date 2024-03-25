import 'dart:ui';

import 'package:dex_pr/presentation/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dex_pr/presentation/app_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../core/domain/intl/generated/l10n.dart';
import '../theme/color_collection.dart';
class RecoveryPassword extends StatefulWidget {
  @override
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}
class _RecoveryPasswordState extends State<RecoveryPassword> {
  final TextEditingController phoneController=TextEditingController();
  late final ValueNotifier<bool> isCheckedPhoneNotifier;
  @override
  void initState() {
    super.initState();
    isCheckedPhoneNotifier = ValueNotifier<bool>(false);
    phoneController.addListener(_checkTextField);
  }

  void _checkTextField() {
    isCheckedPhoneNotifier.value = phoneController.text.isNotEmpty;
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F9),
      appBar: RegisterAppBar(
        context: context, title1: 'Восстановление пароля',),
      body: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text('Введите почту, на которую будет отправлен код для сброса пароля', style: TextStyle(fontSize: 14, color: Color(0xFF4F4449)),),
            SizedBox(height: 20,),
            PhoneField(phoneController: phoneController, context: context),
            SizedBox(height: 20,),
            ValueListenableBuilder(
              valueListenable: isCheckedPhoneNotifier,
              builder: (context, value, child) {
                return PinkButtonSend(
                  text: Text(
                    S.of(context).Send,
                    style: TextStyle(color: value ? Color(0xFFFFFFFF) : Color(0xFF211A1D)),
                  ),
                  context: context,
                  isChecked: value,
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
class PhoneField extends TextField {
  PhoneField({
    Key? key,
    required TextEditingController phoneController,
    required BuildContext context,
  }) : super(
    controller: phoneController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Color(0xFF81737A),
        ),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3.0,
          color: ColorCollection.primary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0, // Отступы по вертикали
        horizontal: 12.0, // Отступы по горизонтали
      ),
      prefixIcon: Transform.scale(
        scale: 0.5,
        child: SvgPicture.asset(
          'assets/svg/phone.svg',
        ),
      ),
      labelText: S
          .of(context)
          .phone,
      labelStyle: TextStyle(
        color: Color(0xFF81737A),
        fontSize: 14,
      ),
    ),
  );
}

class PinkButtonSend extends FilledButton{
  PinkButtonSend({
    Key? key,
    required Text text,
    required BuildContext context,
    required bool isChecked,
  }) : super(
      style: FilledButton.styleFrom(
        backgroundColor: isChecked ? Color(0xFFDF3A76) : Color(0xFF1D1B201F),
        padding:
        EdgeInsets.symmetric(vertical: 16.0, horizontal: 90.0),
      ),
      onPressed: () {},
      child: Text(
        S.of(context).registration,
        style: TextStyle(color: isChecked?Color(0xFFFFFFFF):Color(0xFF211A1D)),
      )
  );
}