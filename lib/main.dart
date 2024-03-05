import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhome/bottomNavigation/bottom_navigation.dart';
import 'package:medhome/screens/onboarding/introduction_screen.dart';

import 'blocs/login/login_bloc.dart';
import 'core/api/auth_api_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc( authApi: AuthApiImpl()),
        ),
      ],
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Med Home',
            debugShowCheckedModeBanner: false,
            // supportedLocales: L10n.all,
            // locale: locale,
            // localizationsDelegates: [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate
            // ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const IntroductionScreen(),
          );
        },
      ),
    );

  }
}
