import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/widgets/flat_button.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isButtonActive = false;

  void _checkPasswordValidity() {
    final isPasswordMatch =
        _passwordController.text == _confirmPasswordController.text;
    final isPasswordNotEmpty = _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty;

    setState(() {
      _isButtonActive = isPasswordMatch && isPasswordNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordValidity);
    _confirmPasswordController.addListener(_checkPasswordValidity);
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

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
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호 확인을 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FlatButton(
                onPressed: () {
                  context.go('/');
                },
                text: 'Complete Registration',
                isActive: _isButtonActive)
          ],
        ),
      ),
    );
  }
}
