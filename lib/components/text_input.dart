import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? textString;
  final TextEditingController? textController;
  final String? hint;
  final bool? obscureText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final void Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  final bool autofocus;

  final FocusNode? focusNode;

  const TextInput(
      {Key? key,
      this.textString,
      this.textController,
      this.hint,
      this.obscureText = false,
      this.onChange,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onFieldSubmitted,
      this.autofocus = false,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //style: const TextStyle(color: Color(0xFF000000)),
      //cursorColor: const Color(0xFF9b9b9b),
      validator: validator,
      controller: textController,
      autofocus: autofocus,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: TextInputType.text,
      obscureText: obscureText!,
      onChanged: onChange,
      focusNode: focusNode,
      decoration: InputDecoration(
          hintText: textString,
          hintStyle: const TextStyle(
              // color: Color(0xFF9b9b9b),
              fontSize: 15,
              fontWeight: FontWeight.normal),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon
          ),
    );
  }
}
