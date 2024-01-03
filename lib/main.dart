import 'package:aladdin_jin/colors.dart';
import 'package:aladdin_jin/home_screen.dart';
import 'package:flutter/material.dart';



//  hind aka terminalga flutter create aladdin_jin --org com.muhammadaminjon,aladdin_jin 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


     
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aladdin Jin',
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: Rang.white,
        appBarTheme: const AppBarTheme(
          backgroundColor:  Rang.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}




// bizga openai sayti api kerak
// developers
// Documentation
// profil bosiladi
// va vievApi KEYS bosiladi
//create new api key
//link beradi
// linkni qo'ygandan keyin api reference ga kiriladi
// http pakegini olish kerak 
// completions kirish kerak

// va bizga chat va images kerak bo'ladi
