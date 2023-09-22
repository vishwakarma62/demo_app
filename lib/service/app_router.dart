

import 'package:demo_app/screen/recycle_bin.dart';
import 'package:demo_app/screen/tabscreen.dart';
import 'package:demo_app/screen/taskscreentwo.dart';
import 'package:flutter/material.dart';

import '../screen/pendingtaskscreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) {
          return RecycleBin();
        });

      case TabScreen.id:
        return MaterialPageRoute(builder: (context) {
          return TabScreen();
        });
    }
    return null;
  }
}
