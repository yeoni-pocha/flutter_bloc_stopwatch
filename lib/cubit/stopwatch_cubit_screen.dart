import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_bloc/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_bloc/cubit/stopwatch_cubit.dart';
import 'package:stopwatch_bloc/utils.dart';

class StopWatchCubitScreen extends StatelessWidget {
  const StopWatchCubitScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('스톱워치'),
    ),
    body: Column(
      children: [
        Center(
          child: BlocBuilder<StopwatchCubit, StopwatchState>(
              builder: (context, state) {
                return Text(
                  formatElapsedTime(state.elapsedTime),
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                );
              }),
        ),
        Expanded(
            child: BlocBuilder<StopwatchCubit, StopwatchState>(
              builder: (context, state) => ListView.builder(
                  itemCount: state.laps.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Lap ${index + 1}: ${state.laps[index]}'),
                  )),
            ))
      ],
    ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () =>
              context.read<StopwatchCubit>().started(),
          tooltip: '시작',
          child: const Icon(Icons.play_arrow),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<StopwatchCubit>().stopped(),
          tooltip: '정지',
          child: const Icon(Icons.stop),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<StopwatchCubit>().reset(),
          tooltip: '초기화',
          child: const Icon(Icons.refresh),
        ),
        FloatingActionButton(
            onPressed: () => context.read<StopwatchCubit>().lapRecorded(),
            tooltip: "랩 기록",
            child: const Icon(Icons.flag))
      ],
    ),
  );
}
