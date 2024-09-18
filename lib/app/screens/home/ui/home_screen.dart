import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';
import 'package:sof_users/app/screens/home/ui/sof_user_row.dart';
import 'package:sof_users/app/utils/custom_list_skeleton.dart';
import 'package:sof_users/app/utils/seperated_list_view.dart';
import 'package:sof_users/app/utils/toast_manager.dart';
import 'package:sof_users/app/widgets/custom_empty.dart';
import 'package:sof_users/core/constants/app_enum.dart';
import 'package:sof_users/core/di/injection_container.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/domain/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = getIt<HomeBloc>();

  void _getListSofUser({bool isFirstFetch = false}) {
    _homeBloc.add(GetListSofEvent(isFirstFetch: isFirstFetch));
  }

  @override
  void initState() {
    _getListSofUser(isFirstFetch: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_background,
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return const CustomListSkeleton();
              }

              if (state is GetListSofError) {
                ToastManager.showNotificationToast(
                    type: ToastType.Error,
                    msg: "Get List Sof Failed ${state.data.error}");
              }

              return _buildListUsers(
                bottomLoading: state is GetListSofBottomLoading,
                listSofUsers: state.data.listSofUser,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListUsers(
      {required bool bottomLoading, required List<UserModel> listSofUsers}) {
    if (listSofUsers.isEmpty) {
      return const CustomEmpty();
    }

    return Column(
      children: [
        SeperatedListView(
            itemCount: listSofUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return const SofUserRow();
            })
      ],
    );
  }
}
