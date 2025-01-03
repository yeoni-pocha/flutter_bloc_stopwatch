// 라우터 설정
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_bloc/pages/home_screen.dart';
import 'package:stopwatch_bloc/pages/step_one.dart';
import 'package:stopwatch_bloc/pages/step_three.dart';
import 'package:stopwatch_bloc/pages/step_two.dart';
import 'package:stopwatch_bloc/pages/stopwatch_bloc_screen.dart';
import 'package:stopwatch_bloc/pages/stopwatch_cubit_screen.dart';

import 'cubit/stopwatch_cubit.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => BlocProvider(
        create: (context) => StopwatchBloc(),
        child: const StopWatchBlocScreen(),
      ),
    ),
    GoRoute(
      path: '/cubit',
      builder: (context, state) => BlocProvider(
        create: (context) => StopwatchCubit(),
        child: const StopWatchCubitScreen(),
      ),
    ),
    GoRoute(
      path: '/one',
      builder: (context, state) => const StepOne(),
    ),
    GoRoute(
      path: '/two',
      builder: (context, state) => const StepTwo(),
    ),
    GoRoute(
      path: '/three',
      builder: (context, state) => const StepThree(),
    ),
  ],
);
