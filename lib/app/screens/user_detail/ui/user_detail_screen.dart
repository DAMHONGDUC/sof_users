import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/user_detail/bloc/user_detail_bloc.dart';
import 'package:sof_users/app/utils/toast_manager.dart';
import 'package:sof_users/app/widgets/custom_app_bar.dart';
import 'package:sof_users/core/constants/app_enum.dart';

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
      body: BlocListener<UserDetailBloc, UserDetailState>(
        listener: (context, state) {
          if (state is GetUserDetailError) {
            ToastManager.showNotificationToast(
                type: ToastType.Error, msg: "Home Error: ${state.data.error}");
          }
        },
        child: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
