import 'package:e_commerce_app/view/widget/textstyle.dart';
import 'package:flutter/material.dart';

class CategoriBtn extends StatelessWidget {
  const CategoriBtn(
      {super.key, required this.lable, required this.buttonClr, this.onPres});
  final void Function()? onPres;
  final String lable;
  final Color buttonClr;

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: onPres,
      child: Container(
        height: 40,
        width: widths * 0.235,
        decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: buttonClr, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Text(
            lable,
            style: textstyle(20, buttonClr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
