import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key, required this.title,required this.controller,this.validator,this.maxLines=1}) : super(key: key);
 final TextEditingController controller;
 final String title ;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
