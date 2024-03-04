import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhome/core/api/auth_api_impl.dart';
import 'package:medhome/screens/login/login_screen.dart';
import 'package:medhome/screens/onboarding/introduction_screen.dart';
import 'package:medhome/widgets/profile.dart';

import 'blocs/login/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Med Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => LoginBloc(authApi: AuthApiImpl()), // Provide your LoginBloc here
          child: LoginScreen(),
        ),
    );
  }
}
