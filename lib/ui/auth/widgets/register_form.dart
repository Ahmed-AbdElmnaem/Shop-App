import 'package:flutter/material.dart';
import 'package:tahadoapp/core/widgets/app_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.emailConteroller,
    required this.passConteroller,
    required this.nameConteroller,
    required this.phoneConteroller,
  });

  final TextEditingController emailConteroller;
  final TextEditingController nameConteroller;
  final TextEditingController passConteroller;
  final TextEditingController phoneConteroller;

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppTextFormField(
            controller: nameConteroller,
            hintText: "Enter name",
            suffixIcon: const Icon(Icons.person),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextFormField(
                controller: phoneConteroller,
                hintText: "Enter phone",
                suffixIcon: const Icon(Icons.phone_android),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                }))
      ],
    );
  }
}
