import 'package:blood_donation_app/view/add_screen/add_screen.dart';
import 'package:blood_donation_app/view/home_screen/home_screen.dart';
import 'package:blood_donation_app/view/update_screen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/HomeScreen':(context) => HomeScreen(),
        "/AddScreen":(context) => AddUserScreen(),
        '/UpdateScreen':(context) => UpdateScreen()

      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}
