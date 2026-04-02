import 'package:expense_traker/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 154, 58, 183));

var kDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark,seedColor: const Color.fromARGB(255, 0, 0, 0));
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
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.onPrimaryContainer,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer
          )
        ),
        

        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: GoogleFonts.inter(fontSize: 40),
            bodyMedium: GoogleFonts.inter(fontSize: 14,color: kColorScheme.onPrimaryContainer)
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
