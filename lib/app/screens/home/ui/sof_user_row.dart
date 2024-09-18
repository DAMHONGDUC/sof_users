import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_box_model.dart';
import 'package:sof_users/domain/model/user_model.dart';

class SofUserRow extends StatelessWidget {
  const SofUserRow({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppBoxModel.halfMainPadding()),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [Text("hello"), Text("hello")],
          ),
          Text("hello")
        ],
      ),
    );
  }
}
