import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_bloc/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_bloc/utils.dart';
import 'package:go_router/go_router.dart';

class StopWatchBlocScreen extends StatelessWidget {
  const StopWatchBlocScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('스톱워치'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: BlocBuilder<StopwatchBloc, StopwatchState>(
                  builder: (context, state) {
                return Text(
                  formatElapsedTime(state.elapsedTime),
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                );
              }),
            ),
            Expanded(
                child: BlocBuilder<StopwatchBloc, StopwatchState>(
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
              heroTag: 'startBloc',
              onPressed: () =>
                  context.read<StopwatchBloc>().add(const StopwatchStarted()),
              tooltip: '시작',
              child: const Icon(Icons.play_arrow),
            ),
            FloatingActionButton(
              heroTag: 'stopBloc',
              onPressed: () =>
                  context.read<StopwatchBloc>().add(const StopwatchStopped()),
              tooltip: '정지',
              child: const Icon(Icons.stop),
            ),
            FloatingActionButton(
              heroTag: 'resetBloc',
              onPressed: () =>
                  context.read<StopwatchBloc>().add(const StopwatchReset()),
              tooltip: '초기화',
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              heroTag: 'lapBloc',
              onPressed: () =>
                  context.read<StopwatchBloc>().add(const StopwatchRecorded()),
              tooltip: "랩 기록",
              child: const Icon(Icons.flag))
          ],
        ),
      );
}
