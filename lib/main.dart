import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
