import 'package:flutter/material.dart';

class CloseSoftKeyboardOnClickOusideForm extends StatelessWidget {
  const CloseSoftKeyboardOnClickOusideForm({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
