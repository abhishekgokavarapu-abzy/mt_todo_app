import 'package:flutter/material.dart';

ThemeData kThemeData = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: Color(0xFF192B6A),
    accentColor: Color(0xFF818285),
    checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(Color(0xFF192B6A)),
        overlayColor: MaterialStateProperty.all(Color(0xFF192B6A))));

String kTaskDataHiveBox = 'task-box';
