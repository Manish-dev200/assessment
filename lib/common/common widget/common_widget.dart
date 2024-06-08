import 'package:assessment/common/color/colors.dart';
import 'package:flutter/material.dart';

class CommonWidget {
  static Widget commonField(
      {TextEditingController? controller,
      String? Function(String?)? validator,
      bool? obscureText,
        TextStyle? style,
      InputDecoration? decoration}) {
    return TextFormField(
      controller: controller,
      decoration: decoration,
      obscureText: obscureText!,
      validator: validator,
      style: style,
    );
  }

  static void alertBox(BuildContext context,{required String title,required String content,required String buttonText}){
     showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text(buttonText))
        ],
      );
    },);
  }

  static Widget commonButton(BuildContext context,
      {void Function()? onPressed, required Widget child}) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size.height*0.07,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: child,
      )
    );
  }
}
