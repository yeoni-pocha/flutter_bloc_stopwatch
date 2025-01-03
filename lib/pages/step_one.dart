import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/widgets/flat_button.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final TextEditingController _emailController = TextEditingController();
  bool _isButtonActive = false;

  void _checkEmailValidity() {
    final email = _emailController.text;
    final isEmailValid =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(email);
    setState(() {
      _isButtonActive = isEmailValid;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkEmailValidity);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

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
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: '이메일',
                  hintText: '이메일을 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FlatButton(
                onPressed: () {
                  context.go('/two');
                },
                text: 'Next',
                isActive: _isButtonActive)
          ],
        ),
      ),
    );
  }
}
