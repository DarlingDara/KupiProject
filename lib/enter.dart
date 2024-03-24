import 'package:dex_pr/generated/l10n.dart';
import 'package:dex_pr/theme/color_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Enter extends StatefulWidget {
  const Enter({super.key});

  @override
  _EnterState createState() => _EnterState();
}

class _EnterState extends State<Enter> {
  // названия переменных и полей должны быть с маленькой буквы,
  // так же в текущем варианте использовать late не нужно,
  // можно сразу инициализировать значение переменной
  late final TextEditingController _Phone;
  late final TextEditingController _Pass;
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _Phone = TextEditingController();
    _Pass = TextEditingController();
    _Phone.addListener(_checkFields);
    _Pass.addListener(_checkFields);
  }

  void _checkFields() {
    //  от сет стейтов внутри ферстки целой страницы нужно избавляться.
    setState(() {
      _isFilled = _Phone.text.isNotEmpty && _Pass.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // цвета нужно применять из COlorCOllection или Темы (Theme.of(context)).
        backgroundColor: const Color(0xFFFFF8F9),
        body: ListView(
          children: [
            Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 75.0, right: 16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _Phone,
                      // Cтили нужно вынести в тему или в отдельный виджет
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Color(0xFF81737A),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3.0,
                            color: ColorCollection.primary,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        prefixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            // СВГ использовать из коллекции
                            'assets/svg/phone.svg',
                          ),
                        ),
                        labelText: S.of(context).Phone,
                        labelStyle: const TextStyle(
                          color: Color(0xFF81737A),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    TextField(
                      controller: _Pass,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Color(0xFF81737A),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3.0,
                            color: ColorCollection.primary,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        prefixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            'assets/svg/lock.svg',
                          ),
                        ),
                        labelText: S.of(context).password,
                        labelStyle: const TextStyle(
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
                    FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: _isFilled
                              ? const Color(0xFFDF3A76)
                              : const Color(0xff1d1b201f),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 140.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          S.of(context).enter,
                          style: TextStyle(
                              color: _isFilled
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF211A1D)),
                        )),
                    Container(
                      height: 15,
                    ),
                    FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFFFF8F9),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 110.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          S.of(context).forgorPassword,
                          style: const TextStyle(color: Color(0xFFDF3A76)),
                        )),
                  ],
                )),
          ],
        ));
  }
}
