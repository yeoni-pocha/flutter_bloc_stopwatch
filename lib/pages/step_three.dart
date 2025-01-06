import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/bloc/email_bloc.dart';
import 'package:stopwatch_bloc/bloc/name_bloc.dart';
import 'package:stopwatch_bloc/bloc/password_bloc.dart';
import 'package:stopwatch_bloc/widgets/flat_button.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PasswordBloc, PasswordState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (password) => context
                      .read<PasswordBloc>()
                      .add(PasswordChanged(password)),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '비밀번호',
                      hintText: '비밀번호를 입력하세요',
                      border: OutlineInputBorder(),
                      errorText: !state.isPasswordValid
                          ? '비밀번호는 8자리 이상이여야 합니다.'
                          : null),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<PasswordBloc, PasswordState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (password) => context
                      .read<PasswordBloc>()
                      .add(ConfirmPasswordChanged(password)),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '비밀번호 확인',
                      hintText: '비밀번호 확인을 입력하세요',
                      border: OutlineInputBorder(),
                      errorText: !state.isConfirmPasswordValid
                          ? '비밀번호가 일치하지 않습니다.'
                          : null),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<PasswordBloc, PasswordState>(
              buildWhen: (prev, cur) =>
                  prev.isPasswordValid != cur.isPasswordValid ||
                  prev.isConfirmPasswordValid != cur.isConfirmPasswordValid,
              builder: (context, state) {
                return FlatButton(
                    onPressed: () {
                      // 제출 후 초기화
                      context.read<EmailBloc>().add(const EmailSubmitted());
                      context.read<NameBloc>().add(const NameSubmitted());
                      context
                          .read<PasswordBloc>()
                          .add(const PasswordSubmitted());
                      context.go('/');
                    },
                    text: 'Complete Registration',
                    isActive:
                        state.isPasswordValid && state.isConfirmPasswordValid);
              },
            )
          ],
        ),
      ),
    );
  }
}
