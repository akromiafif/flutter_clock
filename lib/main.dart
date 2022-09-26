import 'package:flutter/material.dart';
import 'package:flutter_clock/enums.dart';
import 'package:flutter_clock/homepage.dart';
import 'package:flutter_clock/menu_info.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) =>
            MenuInfo(MenuType.clock, title: 'Clock', imageSource: 'test'),
        child: const HomePage(),
      ),
    );
  }
}
