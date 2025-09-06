

import 'package:flutter/material.dart';
import 'package:todolist/common/theme/input_decoration.dart';

class InputTextValidation extends StatelessWidget {
  const InputTextValidation({
    super.key,
    required this.titulo,
    this.hintText,
    this.tipo,
    this.onChanged,
    this.errorMessage,
    this.obscureText = false,
    this.validator,
    this.initial,
    this.enable = true,
    this.controller,
  });

  final Function(String)? onChanged;
  final String? initial;
  final String? errorMessage;
  final bool obscureText;
  final String titulo;
  final String? hintText;
  final TextInputType? tipo;
  final String? Function(String?)? validator;
  final bool? enable;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          initialValue: initial,
          controller: controller,
          keyboardType: tipo,
          validator: validator,
          enabled: enable,
          obscureText: obscureText,
          onChanged: onChanged,
          autofocus: false,
          decoration:
              InputDecorations.authInputDecoration(hintText: hintText, error: errorMessage),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}