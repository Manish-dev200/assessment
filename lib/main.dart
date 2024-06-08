import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assessment/auth/presentation/page/login_page.dart';
import 'package:assessment/auth/presentation/provider/login_provider.dart';
import 'package:assessment/dashboard/business/use%20case/api.dart';
import 'package:assessment/dashboard/presentation/page/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyDq1dTr2fyv8k798CiRNN73l6RqS6NxRYk", appId: '1:276507141994:android:0b5957e5b450f39669a713', messagingSenderId: '276507141994', projectId: 'assessment-928a5')
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider())
      ],
      child: MaterialApp(
        home: user != null ? const DashBoardPage() : const LoginPage(),
      )
    );
  }
}
