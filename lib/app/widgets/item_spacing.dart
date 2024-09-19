import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_box_model.dart';

class VerticalSpacing extends StatelessWidget {
  final double? value;
  const VerticalSpacing({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value ?? AppBoxModel.itemSpacing(),
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double? value;
  const HorizontalSpacing({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value ?? AppBoxModel.itemSpacing());
  }
}
