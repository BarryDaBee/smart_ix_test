import 'package:flutter/material.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/flavors/flavors.dart';

void main() {
  F.appFlavor = Flavor.prod;
  runApp(const App());
}
