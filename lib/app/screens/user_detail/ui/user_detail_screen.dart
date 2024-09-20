import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/user_detail/bloc/user_detail_bloc.dart';
import 'package:sof_users/app/screens/user_detail/ui/reputation_row.dart';
import 'package:sof_users/app/utils/toast_manager.dart';
import 'package:sof_users/app/widgets/custom_app_bar.dart';
import 'package:sof_users/app/widgets/custom_empty.dart';
import 'package:sof_users/app/widgets/custom_list_skeleton.dart';
import 'package:sof_users/app/widgets/custom_scroll_bar.dart';
import 'package:sof_users/app/widgets/seperated_list_view.dart';
import 'package:sof_users/core/constants/app_enum.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/domain/model/reputation_model.dart';

class UserDetailArgs {
  final int userId;
  final String? userName;

  UserDetailArgs({required this.userId, this.userName});
}

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key, required this.args});
  final UserDetailArgs args;

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  void _getUserDetal() {
    context
        .read<UserDetailBloc>()
        .add(GetUserDetailEvent(userId: widget.args.userId));
  }

  @override
  void initState() {
    _getUserDetal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.args.userName ?? "User detail",
      ),
      backgroundColor: AppColors.primary_background,
      body: Column(
        children: [
          BlocListener<UserDetailBloc, UserDetailState>(
            listener: (context, state) {
              if (state is GetUserDetailError) {
                ToastManager.showNotificationToast(
                    type: ToastType.Error,
                    msg: "Home Error: ${state.data.error}");
              }
            },
            child: BlocBuilder<UserDetailBloc, UserDetailState>(
              buildWhen: (previous, current) {
                return current is GetUserDetailLoading ||
                    current is GetUserDetailSuccess;
              },
              builder: (context, state) {
                if (state is GetUserDetailLoading) {
                  return const CustomListSkeleton();
                }

                if (state is GetUserDetailSuccess) {
                  return _buildListReputation(
                    listReputation: state.data.listReputation,
                  );
                }

                return const CustomEmpty();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListReputation({required List<ReputationModel> listReputation}) {
    if (listReputation.isEmpty) {
      return const CustomEmpty();
    }

    return Expanded(
      child: CustomScrollBar(
        child: SeperatedListView(
            listKey: "list_reputation",
            itemCount: listReputation.length,
            itemBuilder: (BuildContext context, int index) {
              return ReputationRow(
                reputation: listReputation[index],
              );
            }),
      ),
    );
  }
}
