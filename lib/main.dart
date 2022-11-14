import 'package:expense_manager/google_sheets_api.dart';
import 'package:flutter/material.dart';

import 'main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Manager",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff17991b),
        ),
      ),
      home: MainView(),
    );
  }
}
