import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stopwatch_bloc/widgets/flat_button.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonActive = false;

  void _checkNameLength() {
    final nameLength = _nameController.text.length;
    setState(() {
      _isButtonActive = nameLength > 2;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkNameLength);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

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
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: '이름',
                  hintText: '이름을 입력하세요',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FlatButton(
                onPressed: () {
                  context.go('/three');
                },
                text: 'Next',
                isActive: _isButtonActive)
          ],
        ),
      ),
    );
  }
}
