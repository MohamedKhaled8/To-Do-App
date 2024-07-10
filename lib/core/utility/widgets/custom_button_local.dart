import 'package:flutter/material.dart';
import 'package:todoapp/core/utility/helper/spacing.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';


class CustomButtonLocal extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final String title;
  final double fontSize;
  final Color color;
  final Color colorIcon;
  final bool isColor;
  final Color? shadowColor; 
  final IconData? icon;
  final double iconSize;
  final Color? secondaryColor;
  final void Function()? onTap;
  const CustomButtonLocal({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
    required this.title,
    required this.fontSize,
    required this.color,
    required this.colorIcon,
    required this.isColor,
    required this.icon,
    required this.iconSize,
    required this.onTap,
    this.shadowColor,
    this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: isColor
              ? null
              : [
                  BoxShadow(
                    color: shadowColor ?? ColorsManger.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), 
                  ),
                ],
          borderRadius: borderRadius,
          color: isColor
              ? ColorsManger.primaryColor
              : (secondaryColor ?? ColorsManger.white),
        ),
        child: Row(
          children: [
            Icon(icon, color: colorIcon, size: iconSize),
            horizintalSpace(20),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: fontSize,
                    color: isColor == true ? ColorsManger.white : color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
