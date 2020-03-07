import 'package:flutter/material.dart';
import 'package:morecomponentes/src/pages/alert_page.dart';
import 'package:morecomponentes/src/pages/animated_container_page.dart';
import 'package:morecomponentes/src/pages/avatar_page.dart';
import 'package:morecomponentes/src/pages/card_page.dart';
import 'package:morecomponentes/src/pages/home_page.dart';
import 'package:morecomponentes/src/pages/inputs_page.dart';
import 'package:morecomponentes/src/pages/listview_pages.dart';
import 'package:morecomponentes/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() => <String, WidgetBuilder>{
      '/': (context) => HomePage(),
      AlertPage.pathName: (context) => AlertPage(),
      AvatarPage.pathName: (context) => AvatarPage(),
      CardPage.pathName: (context) => CardPage(),
      AnimatedContainerPage.pathName: (context) => AnimatedContainerPage(),
      InputsPage.pathName: (context) => InputsPage(),
      SliderPage.pathName: (context) => SliderPage(),
      ListPage.pathName: (context) => ListPage(),
    };
