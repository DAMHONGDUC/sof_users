import 'package:flutter/material.dart';
import 'package:sof_users/app/utils/helpers.dart';
import 'package:sof_users/app/widgets/info_row.dart';
import 'package:sof_users/core/resources/app_box_model.dart';
import 'package:sof_users/domain/model/reputation_model.dart';

class ReputationRow extends StatelessWidget {
  const ReputationRow({super.key, required this.reputation});

  final ReputationModel reputation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppBoxModel.halfMainPadding()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoRow(
            title: "Post ID",
            content: reputation.postId.toString(),
          ),
          InfoRow(
            title: "Reputation Type",
            content: reputation.reputationHistoryType,
          ),
          InfoRow(
            title: "Created At",
            content: AppTimeFormat().formatMilisecTime(reputation.creationDate),
          ),
          InfoRow(
            title: "Change",
            content:
                AppTimeFormat().formatMilisecTime(reputation.reputationChange),
          ),
        ],
      ),
    );
  }
}
