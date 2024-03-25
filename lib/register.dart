import 'package:dex_pr/presentation/Widgets.dart';
import 'package:dex_pr/theme/color_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dex_pr/core/domain/intl/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  late final TextEditingController phoneController;
  late final TextEditingController passController;
  late final TextEditingController passController2;
  late final TextEditingController textController;
  late final ValueNotifier<bool> _isFieldFilled;
  bool _isFilled = false;
  bool _isChecked = false;
  late bool isCheckedRegister;
  late final ValueNotifier<bool> isCheckedRegisterNotifier;

  @override
  void initState() {
    super.initState();
    isCheckedRegisterNotifier = ValueNotifier<bool>(_isChecked);
    phoneController = TextEditingController();
    passController = TextEditingController();
    phoneController.addListener(_checkFields);
    passController.addListener(_checkFields);
    passController2 = TextEditingController();
    passController2.addListener(_checkFields);
    textController = TextEditingController();
    _isFieldFilled = ValueNotifier<bool>(false);
    textController.addListener(_checkFields);
    isCheckedRegister = _isChecked;
  }

  void _checkFields() {
    setState(() {
      _isFilled = phoneController.text.isNotEmpty && passController.text.isNotEmpty && passController2.text.isNotEmpty;
      _isChecked=_isFilled;
      isCheckedRegisterNotifier.value = _isFilled;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F9),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, top: 75.0, right: 16.0),

            child: Column(
              children: [
                PhoneField(phoneController: phoneController,context: context,),
                Container(
                  height: 15,
                ),
                TextField(
                  controller: passController,
                  obscureText: true,
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
                        'assets/svg/lock.svg',
                      ),
                    ),
                    labelText: S.of(context).password,
                    labelStyle: TextStyle(
                      color: Color(0xFF81737A),
                      fontSize: 14,
                    ),
                    suffixIcon: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        'assets/svg/close_eye.svg',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                ),
                TextField(
                  controller: passController2,
                  obscureText: true,
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
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                    prefixIcon: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        'assets/svg/lock.svg',
                      ),
                    ),
                    labelText: S.of(context).repeatPassword,
                    labelStyle: TextStyle(
                      color: Color(0xFF81737A),
                      fontSize: 14,
                    ),
                    suffixIcon: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        'assets/svg/close_eye.svg',

                      ),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                ),
                 CheckboxListTile(
                   controlAffinity: ListTileControlAffinity.leading,
                  title: Text(S.of(context).imAgreedWithPrivacyAndPolicyUsage, style: TextStyle(fontSize: 14),),
                  value: _isChecked,
                  activeColor: ColorCollection.primary,

                  onChanged: (newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                  },
                ),
                Container(
                  height: 15,
                ),
          ValueListenableBuilder(
            valueListenable: isCheckedRegisterNotifier,
            builder: (context, value, child) {
              return PinkButtonSend(
                text: Text(
                  S.of(context).registration,
                  style: TextStyle(color: value ? Color(0xFFFFFFFF) : Color(0xFF211A1D)),
                ),
                context: context,
                isChecked: value,
              );
            },
          ),



              ],),
          ),
        ],
      )
    );
  }
}
