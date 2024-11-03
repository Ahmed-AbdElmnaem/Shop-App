import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/core/services/api_service.dart';
import 'package:tahadoapp/core/widgets/app_button.dart';
import 'package:tahadoapp/core/widgets/app_text_form_field.dart';
import 'package:tahadoapp/logic/login_cubit/login_cubit.dart';
import 'package:tahadoapp/logic/login_cubit/login_state.dart';
import 'package:tahadoapp/logic/register_cubit/register_cubit.dart';
import 'package:tahadoapp/logic/register_cubit/register_state.dart';
import 'package:tahadoapp/ui/auth/widgets/register_form.dart';
import 'package:tahadoapp/ui/home/home_page.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController imageConteroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errMessage.toString()),
                ),
              );
            } else if (state is RegisterSuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Create Account'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.network(
                            'https://img.lovepik.com/photo/45009/7673.jpg_wh860.jpg'),
                        const SizedBox(),
                        const SizedBox(
                          height: 20,
                        ),
                        RegisterForm(
                          emailConteroller: emailController,
                          passConteroller: passwordController,
                          nameConteroller: nameController,
                          phoneConteroller: phoneController,
                        ),
                        state is! RegisterLoadingState
                            ? AppButton(
                                text: "sign up",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<RegisterCubit>().userRegister(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          image: imageConteroller.text,
                                        );
                                  }
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
