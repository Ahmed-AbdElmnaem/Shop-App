import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/core/widgets/app_button.dart';
import 'package:tahadoapp/core/widgets/app_text_form_field.dart';
import 'package:tahadoapp/logic/login_cubit/login_cubit.dart';
import 'package:tahadoapp/logic/login_cubit/login_state.dart';
import 'package:tahadoapp/ui/auth/register.dart';
import 'package:tahadoapp/ui/auth/widgets/login_form.dart';
import 'package:tahadoapp/ui/home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errMessage.toString()),
              ),
            );
          } else if (state is LoginSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        'https://img.lovepik.com/photo/45009/7677.jpg_wh860.jpg'),
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    LoginForm(
                      emailConteroller: emailController,
                      passConteroller: passController,
                    ),
                    state is! LoginLoadingState
                        ? AppButton(
                            text: "Login",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginCubit>().userLogin(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                              }
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // ترتيب العناصر من اليسار
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateAccount()));
                            },
                            child: const Text("Create account?"),
                          ),
                          const SizedBox(height: 10), // مسافة بين العناصر
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forget password"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
