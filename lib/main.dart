import 'package:flutter/material.dart';
import 'package:task_2/app.dart';
import 'package:task_2/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  runApp(const MovieApp());
}
