import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';
import 'package:sof_users/app/screens/home/ui/home_app_bar.dart';
import 'package:sof_users/app/screens/home/ui/sof_user_row.dart';
import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/app/widgets/custom_list_skeleton.dart';
import 'package:sof_users/app/widgets/custom_scroll_bar.dart';
import 'package:sof_users/app/widgets/seperated_list_view.dart';
import 'package:sof_users/app/utils/toast_manager.dart';
import 'package:sof_users/app/widgets/custom_empty.dart';
import 'package:sof_users/core/constants/app_enum.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/domain/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  void _getListSofUser({bool globalLoading = false}) {
    context.read<HomeBloc>().add(GetListSofEvent(globalLoading: globalLoading));
  }

  void _handleScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getListSofUser();
    }
  }

  @override
  void initState() {
    // handldle scroll
    _scrollController.addListener(_handleScrolling);

    // get list user
    _getListSofUser(globalLoading: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: AppColors.primary_background,
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is GetListSofGlobalLoading || state is HomeInitial) {
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

    Log.d(bottomLoading);

    return Expanded(
      child: CustomScrollBar(
        child: SeperatedListView(
            scrollController: _scrollController,
            bottomLoading: bottomLoading,
            itemCount: listSofUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return SofUserRow(
                user: listSofUsers[index],
              );
            }),
      ),
    );
  }
}
