import 'dart:math';
import 'package:flutter/material.dart';

class RandomColor {
 static Color get randomColor=> Colors.primaries[Random().nextInt(Colors.primaries.length)];
}