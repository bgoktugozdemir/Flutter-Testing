import 'dart:ui';

import 'package:golden_toolkit/golden_toolkit.dart';

class Devices {
  static final List<Device> allTestDevices = [
    ...Samsung.allDevices,
    ...Apple.allDevices,
  ]..sort((a, b) => a.size.height.compareTo(b.size.height));
}

class Apple {
  const Apple._();

  static const List<Device> allDevices = [
    iphone13,
    iphone13Mini,
    iphone5,
  ];

  static const Device iphone5 = Device(
    name: 'iPhone 5',
    size: Size(320, 568),
  );

  static const Device iphone13Mini = Device(
    name: 'iPhone 13 Mini',
    size: Size(375, 812),
  );

  static const Device iphone13 = Device(
    name: 'iPhone 13',
    size: Size(390, 844),
  );
}

class Samsung {
  const Samsung._();

  static const List<Device> allDevices = [
    s21Ultra,
  ];

  static const Device s21Ultra = Device(
    name: 'Samsung Galaxy S21 Ultra',
    size: Size(384, 854),
  );
}
