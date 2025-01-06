import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/bloc/email_bloc.dart';
import 'package:stopwatch_bloc/widgets/flat_button.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 1'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<EmailBloc, EmailState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (email) =>
                      context.read<EmailBloc>().add(EmailChanged(email)),
                  decoration: InputDecoration(
                      labelText: '이메일',
                      hintText: '이메일을 입력하세요',
                      border: const OutlineInputBorder(),
                      errorText: !state.isValid ? '유효하지 않은 이메일 입니다.' : null),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<EmailBloc, EmailState>(
              buildWhen: (pre, cur) => pre.isValid != cur.isValid,
              builder: (context, state) {
                return FlatButton(
                    onPressed: () {
                      context.go('/two');
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
