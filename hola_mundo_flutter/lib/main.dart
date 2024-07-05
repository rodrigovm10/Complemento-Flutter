import 'package:flutter/material.dart';
import 'package:hola_mundo_flutter/presentation/screens/counter/counter_functions_screen.dart';
import 'package:hola_mundo_flutter/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
        home: const CounterFunctionScreen());
  }
}
