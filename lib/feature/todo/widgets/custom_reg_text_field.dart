import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';

class CustomRegTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool isForDescription;
  const CustomRegTextFormField({
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.isForDescription = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 6 : null,
          cursorHeight: !isForDescription ? 60.h : null,
          style: const TextStyle(
            color: ColorsManger.black,
          ),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            counter: const SizedBox.shrink(),
            hintText: isForDescription ? MyStrings.addNote : null,
            prefixIcon:
                isForDescription ? const Icon(Icons.bookmark_border) : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsManger.grey),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}