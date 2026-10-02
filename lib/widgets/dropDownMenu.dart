import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class DropDownMenuWidget extends StatelessWidget {
  final String selectedValue;
  final String value1;
  final String value2;
  final String choice1;
  final String choice2;

  final VoidCallback onPresssed;

  const DropDownMenuWidget({
    super.key,
    required this.selectedValue,
    required this.onPresssed,
    required this.value1,
    required this.value2,
    required this.choice1,
    required this.choice2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: DropdownButton<String>(
        value: selectedValue,
        items: [
          DropdownMenuItem(value: value1, child: Text(choice1)),
          DropdownMenuItem(value: value2, child: Text(choice2)),
        ],
        onChanged: (String? value) {
          onPresssed();
        },
      ),
    );
  }
}
