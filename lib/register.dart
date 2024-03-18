import 'package:dex_pr/theme/color_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  late final TextEditingController _phoneController;
  late final TextEditingController _passController;
  late final TextEditingController _passController2;
  bool _isFilled = false;
  bool _isChecked = false;


  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passController = TextEditingController();
    _phoneController.addListener(_checkFields);
    _passController.addListener(_checkFields);
    _passController2 = TextEditingController();
    _passController2.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      _isFilled = _phoneController.text.isNotEmpty && _passController.text.isNotEmpty&& _passController2.text.isNotEmpty;
      if (!_isFilled) {
        _isChecked = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F9),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 75.0, right: 16.0),

            child: Column(
              children: [
                TextField(
                  controller: _phoneController,
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
                    labelText: 'Телефон',
                    labelStyle: TextStyle(
                      color: Color(0xFF81737A),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: 15,
                ),
                TextField(
                  controller: _passController,
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
                    labelText: 'Пароль',
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
                  controller: _passController2,
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
                    labelText: 'Повторите пароль',
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
                  title: Text('Я согласен с Правилами и условиями использования ', style: TextStyle(fontSize: 14),),
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
                FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: _isFilled&&_isChecked ? Color(0xFFDF3A76) : Color(0xFF1D1B201F),
                      padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 90.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(color: _isFilled&&_isChecked?Color(0xFFFFFFFF):Color(0xFF211A1D)),
                    )),

              ],),
          ),
        ],
      )
    );
  }
}
