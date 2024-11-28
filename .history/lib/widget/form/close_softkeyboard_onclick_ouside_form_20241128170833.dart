
import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';

class CloseSoftKeyboardOnClickOusideForm extends StatelessWidget {
  const CloseSoftKeyboardOnClickOusideForm({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => THelperFunctions.closeSoftKeyboard(context),
      child: child,
    );
  }
}
