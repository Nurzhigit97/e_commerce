import 'package:e_commerce/shared/core/resources/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return AppInputWidget(
      filledColor: Theme.of(context).colorScheme.surface,
      hintText: 'Поиск...',
      onChanged: onChanged,
    );
  }
}
