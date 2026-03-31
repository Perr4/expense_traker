import 'package:expense_traker/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



var kColorScheme =ColorScheme.fromSeed(seedColor: Colors.deepPurple);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpenseCounter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.onPrimaryContainer,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer
        ),
        textTheme: TextTheme(
          
        )
      ),
      home: const Expenses(),
    );
  }
}

   
