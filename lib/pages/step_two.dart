import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/bloc/name_bloc.dart';
import 'package:stopwatch_bloc/widgets/flat_button.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<NameBloc, NameState>(builder: (context, state) {
              return TextField(
                onChanged: (name) =>
                    context.read<NameBloc>().add(NameChanged(name)),
                decoration: InputDecoration(
                    labelText: '이름',
                    hintText: '이름을 입력하세요',
                    border: OutlineInputBorder(),
                    errorText: !state.isValid ? '유효하지 않은 이름입니다.' : null),
              );
            }),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<NameBloc, NameState>(
              buildWhen: (pre, cur) => pre.isValid != cur.isValid,
              builder: (context, state) {
                return FlatButton(
                    onPressed: () {
                      context.go('/three');
                    },
                    text: 'Next',
                    isActive: state.isValid);
              },
            )
          ],
        ),
      ),
    );
  }
}
