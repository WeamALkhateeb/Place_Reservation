import 'package:flutter/material.dart';
import 'package:project2/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;

  const CustomButtonLang({Key? key,
    required this.text,
    this.onPressed,
    required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed ,
        child: Text(text, style: TextStyle(fontSize: MediaQuery.of(context).size.height/50),),
        color: color,
        textColor: firstBackColor,
      ),
    );
  }
}

