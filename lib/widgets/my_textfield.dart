import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.validator,
    required this.textController,
    // this.autoValidateMode = false,
    this.hintText,
    this.isAmount = false,
  }) : super(key: key);

  bool isAmount;
  TextEditingController textController;
  // bool autoValidateMode;
  FormFieldValidator<String>? validator;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: isAmount ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText ?? "Hint",
        hintStyle: const TextStyle(
          letterSpacing: 1.15,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        isDense: true,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
