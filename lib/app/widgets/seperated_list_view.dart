import 'package:flutter/material.dart';
import 'package:sof_users/app/widgets/custom_list_divider.dart';

class SeperatedListView extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const SeperatedListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const CustomListDivider();
              },
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: itemCount,
              itemBuilder: itemBuilder),
        ],
      ),
    );
  }
}
