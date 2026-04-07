import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfly/Core/Network/locale/shared_prefrence.dart';
import 'package:foodfly/Widgets/foodfly_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  runApp(Foodfly());
}
