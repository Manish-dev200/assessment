import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assessment/auth/presentation/page/login_page.dart';
import 'package:assessment/auth/presentation/provider/login_provider.dart';
import 'package:assessment/dashboard/business/use%20case/api.dart';
import 'package:assessment/dashboard/presentation/page/dashboard_page.dart'; // Import your dashboard page
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getInitialPage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('randomNumber');
    if (token == null) {
      return LoginPage();
    } else {
      return DashBoardPage(); // Navigate to your dashboard page if the token is not null
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider())
      ],
      child: FutureBuilder<Widget>(
        future: _getInitialPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: snapshot.data,
            );
          }
        },
      ),
    );
  }
}
