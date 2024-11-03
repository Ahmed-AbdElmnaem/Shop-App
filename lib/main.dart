import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/core/bloc_observe.dart';
import 'package:tahadoapp/core/services/api_service.dart';
import 'package:tahadoapp/core/widgets/Splash_Screen.dart';
import 'package:tahadoapp/logic/app_cubit/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService.dioInit();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCategoryData(),
      child: MaterialApp(
        theme: ThemeData(),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
