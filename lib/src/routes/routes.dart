import 'package:componente1/src/pages/animate_container.dart';
import 'package:componente1/src/pages/card_page.dart';
import 'package:componente1/src/pages/input_page.dart';
import 'package:flutter/material.dart';
import 'package:componente1/src/pages/alert_page.dart';
import 'package:componente1/src/pages/avatar_page.dart';
import 'package:componente1/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
  };
}
