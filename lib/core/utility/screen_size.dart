import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
  ScreenSize._init();

  factory ScreenSize() {
    return _instance;
  }
  static double defaultWidth=375;
 late Size screenSize;
}

extension DoubleExtension on double {
  // !!!!!! Tasarımın 375px genişliğine göre olması gerekmektedir
  // - Girilen değeri 375 e göre oranlayarak responsive tasarımı yakalar


  //pixel kullanımı
  double get px => (this/ScreenSize.defaultWidth)*ScreenSize().screenSize.width;
  //oran kullanımı
  double get percent => (this/100)*ScreenSize().screenSize.width;


  SizedBox get widthPxBox=>SizedBox(width: px,);
  SizedBox get widthPercentBox=>SizedBox(width: percent,);

  SizedBox get heightPxBox=>SizedBox(height: px,);
  SizedBox get heightPercentBox=>SizedBox(height: percent,);
}