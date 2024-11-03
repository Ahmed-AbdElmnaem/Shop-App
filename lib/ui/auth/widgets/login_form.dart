import 'package:flutter/material.dart';
import 'package:tahadoapp/core/widgets/app_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailConteroller,
    required this.passConteroller,
  });

  final TextEditingController emailConteroller;
  final TextEditingController passConteroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextFormField(
            controller: emailConteroller,
            hintText: "Enter email",
            suffixIcon: const Icon(Icons.email),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextFormField(
            controller: passConteroller,
            hintText: "Enter password",
            suffixIcon: const Icon(Icons.visibility),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
