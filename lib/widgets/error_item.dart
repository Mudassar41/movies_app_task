import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetryPressed;

  const ErrorItem({
    super.key,
    required this.errorMessage,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          errorMessage,
          style: TextStyle(fontSize: 16.0, color: Colors.red),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: onRetryPressed,
          child: Text('Try Again'),
        ),
      ],
    );
  }
}
