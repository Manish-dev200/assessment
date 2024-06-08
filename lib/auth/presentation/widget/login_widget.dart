import 'package:assessment/auth/presentation/provider/login_provider.dart';
import 'package:assessment/common/color/colors.dart';
import 'package:assessment/common/common%20widget/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginWidget {
  static PreferredSizeWidget loginAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.bgColor,
      leading: const Icon(Icons.arrow_back_ios_new),
    );
  }

  static Widget loginBody(BuildContext context,
      {required TextEditingController emailController,
      required TextEditingController passController,
      required void Function()? onPressed,
      required GlobalKey key}) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: size.height *0.01),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: size.height *0.05),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: size.height *0.01),
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(15)),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColor.bgColor,
                      backgroundImage:
                          const AssetImage('assets/images/image.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Log in',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonWidget.commonField(
                    controller: emailController,
                    obscureText: false,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.bgColor,
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 24,
                          color: AppColor.semiBlackColor,
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else if (!value.contains('@')) {
                        return 'Please enter valid email';
                      } else if (!value.contains('.com')) {
                        return 'Please enter valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Password',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, provider, child) {
                      return CommonWidget.commonField(
                        controller: passController,
                        obscureText: provider.obscureText,
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.bgColor,
                            hintText: 'password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.toggleObscureText();
                                },
                                icon: Icon(
                                  provider.obscureText
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off,
                                  size: 24,
                                  color: AppColor.semiBlackColor,
                                )),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: AppColor.semiBlackColor,
                              size: 24,
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6) {
                            return 'Please should be greater than 6';
                          } else {
                            return null;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColor.semiBlackColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonWidget.commonButton(context,
                      onPressed: onPressed,
                      child: Consumer<LoginProvider>(
                        builder: (context, provider, child) => provider.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColor.whiteColor,
                              ))
                            : Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: AppColor.whiteColor, fontSize: 16),
                                ),
                              ),
                      ))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Do not have any account? ',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.semiBlackColor),
              ),
              const Text(
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    ));
  }
}
