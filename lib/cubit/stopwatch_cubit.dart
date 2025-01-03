import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_bloc/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_bloc/utils.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  final Stopwatch _stopwatch = Stopwatch();
  final Duration _tick = const Duration(milliseconds: 10);

  StopwatchCubit() : super(const StopwatchState(elapsedTime: 0, isRunning: false));

  void started() {
    _stopwatch.start();
    emit(state.copyWith(isRunning: true));
    _tickTimer();
  }

  void stopped() {
    _stopwatch.stop();
    emit(state.copyWith(isRunning: false));
  }

  void reset() {
    _stopwatch.reset();
    emit(state.copyWith(elapsedTime: 0, laps: const []));
  }

  void ticked() {
    emit(state.copyWith(elapsedTime: _stopwatch.elapsedMilliseconds));
  }

  void lapRecorded() {
    final lapTime = formatElapsedTime(state.elapsedTime);
    final updatedLaps = List<String>.from(state.laps)..add(lapTime);
    emit(state.copyWith(laps: updatedLaps));
  }

  void _tickTimer() {
    Timer.periodic(_tick, (timer) {
      if (!_stopwatch.isRunning) {
        timer.cancel();
      } else {
        emit(state.copyWith(elapsedTime: _stopwatch.elapsedMilliseconds));
      }
    });
  }
}