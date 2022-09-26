import 'package:flutter/foundation.dart';
import 'package:flutter_clock/enums.dart';

class MenuInfo extends ChangeNotifier {
  late MenuType menuType;
  late String title;
  late String imageSource;

  MenuInfo(this.menuType, {required this.title, required this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
