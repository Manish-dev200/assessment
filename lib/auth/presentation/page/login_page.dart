import 'package:assessment/auth/presentation/provider/login_provider.dart';
import 'package:assessment/auth/presentation/widget/login_widget.dart';
import 'package:assessment/common/color/colors.dart';
import 'package:assessment/common/common%20widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController? controller;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: LoginWidget.loginAppbar(),
        body: LoginWidget.loginBody(context,
            emailController: provider.emailController,
            passController: provider.passwordController,
            key: provider.formKey,
          onPressed: () {
            provider.validateForm(context);
          },
        ),
      ),
    );
  }
}
