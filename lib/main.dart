import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenewHat Buyer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.yellow,
          surface: Colors.white,
          onSurface: Colors.black,
          onPrimary: Colors.black,
        ),
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.yellow,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: const LoginView(),
    );
  }
}
