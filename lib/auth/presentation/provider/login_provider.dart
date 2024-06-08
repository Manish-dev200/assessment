import 'dart:math';

import 'package:assessment/dashboard/presentation/page/dashBoard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{

  final formKey = GlobalKey<FormState>();
  var obscureText = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  validateForm(BuildContext context){
    if(formKey.currentState != null && formKey.currentState!.validate()){
      generateToken();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoardPage(),));
    }
  }

  void generateToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var random = Random();
    int randomNumber = random.nextInt(10000);
    await sp.setString('randomNumber', randomNumber.toString());
    print('Generated random number: $randomNumber');
  }

  void toggleObscureText(){
    obscureText = !obscureText;
    notifyListeners();
  }

}