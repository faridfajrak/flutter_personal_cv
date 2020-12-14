import 'dart:ui';

import 'package:flutter/material.dart';

const String kAppName = '';

const Color kDarkPrimaryColor = Color(0xFFF57C00);
const Color kLightPrimaryColor = Color(0xFFFFE0B2);
const Color kPrimaryColor = Color(0xFF3F51B5);
const Color kAccentColor = Color(0xFFFFC107);
const Color kSecondaryColor = Color(0xFF03A9F4);

const Color kPrimaryTextColor = Color(0xFF212121);
const Color kSecondaryTextColor = Color(0xFF757575);
const Color kDividerColor = Color(0xFFBDBDBD);

const Color kGreenColor = Colors.green;
const Color kMainBgColor = Color(0xFFf5f5f5);
const Color kStopColor = Color(0xFFe4464b);

const TextStyle kTitleTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

const TextStyle kMessageTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontWeight: FontWeight.normal,
  fontSize: 13.0,
);

const String kSharedPrefToken = 'token';
const double bottomNavHeight = 80.0;

const String kConnectionErrorMsg = 'Connection Problem';
const String kInvalidDataErrorMsg = 'Invalid Data';
const String kLorem =
    'Software developer experienced in Flutter, Android and C++,have experience in leading, team player , familiar with web technologies, had worked in banking industry, have bachelor degree in software engineering from univercity of science and culture ';
const BoxShadow kBoxShadow = BoxShadow(
  color: Color(0xFFe0e0e0),
  blurRadius: 5.0, // has the effect of softening the shadow
  spreadRadius: 2.0, // has the effect of extending the shadow
  offset: Offset(
    1.0, // horizontal, move right 10
    3.0, // vertical, move down 10
  ),
);

const BoxShadow kBoxShadowReverse = BoxShadow(
  color: Color(0xFFBDBDBD),
  blurRadius: 5.0, // has the effect of softening the shadow
  spreadRadius: 2.0, // has the effect of extending the shadow
  offset: Offset(
    1.0, // horizontal, move right 10
    3.0, // vertical, move down 10
  ),
);

const BoxDecoration kFormFieldDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(5.0),
    ),
    boxShadow: [kBoxShadow]);

const String PERSONAL_DESCRIPTION =
    'I\'m a software engineer and have experience in many software technologies such as php, python, c++. I know how to design an architecture '
    'for software systems and I am an expert in data base modeling and API design. I have bachelor degree in software engineering from university of science and culture.\n'
    'In the last 3 years I worked in mobile applications sector I had started with android development using java. After a year I change my main programing language to kotlin, and'
    ' learned flutter in the meanwhile. I worked with many teams as mobile developer and team lead, and cooperate closely with backend developers and helped them to design their models and architecture.';

const List<String> SKILLS = [
  'Android',
  'Flutter',
  'Kotlin',
  'Java',
  'C++',
  'MVVM',
  'MVC',
  'SQL',
  'SQLite',
  'REST',
  'SOCKET',
  'RxAndroid',
  'Firebase',
  'PWA',
  'API Design',
];


