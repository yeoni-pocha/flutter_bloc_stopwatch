import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_bloc/bloc/email_bloc.dart';
import 'package:stopwatch_bloc/bloc/name_bloc.dart';
import 'package:stopwatch_bloc/bloc/password_bloc.dart';
import 'package:stopwatch_bloc/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider 예제용
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmailBloc()),
        BlocProvider(create: (context) => NameBloc()),
        BlocProvider(create: (context) => PasswordBloc())
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
