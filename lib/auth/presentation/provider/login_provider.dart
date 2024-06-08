import 'package:assessment/common/common%20widget/common_widget.dart';
import 'package:assessment/dashboard/presentation/page/dashBoard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class LoginProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  var obscureText = false;
  var loading = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    loading = true;
    notifyListeners();
   try{
     await auth
         .signInWithEmailAndPassword(
         email: emailController.value.text,
         password: passwordController.value.text)
         .then((value) {
       loading =false;
       notifyListeners();
       Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => const DashBoardPage(),
       ));
     });
   }on FirebaseAuthException catch(e){
     print('error ${e.toString()}');
     CommonWidget.alertBox(context, title: 'Error', content: 'Invalid credentials', buttonText: 'Ok');
     loading =false;
     notifyListeners();
   }
  }

  validateForm(BuildContext context) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      login(context);
    }
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
