import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';
import 'package:sof_users/app/screens/home/ui/home_app_bar.dart';
import 'package:sof_users/app/screens/home/ui/sof_user_row.dart';
import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/app/utils/toast_manager.dart';
import 'package:sof_users/app/widgets/custom_list_skeleton.dart';
import 'package:sof_users/app/widgets/custom_scroll_bar.dart';
import 'package:sof_users/app/widgets/seperated_list_view.dart';
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
  final ValueNotifier<List<UserModel>> _listSofUserListenable =
      ValueNotifier(([]));
  bool _isGlobalLoading = true;
  bool _hasMore = true;

  void _getListSofUser() {
    context.read<HomeBloc>().add(GetListSofEvent());
  }

  void _onBookmarkUser(UserModel user) {
    context.read<HomeBloc>().add(ToggleBookmarkEvent(user: user));
  }

  @override
  void initState() {
    // get list user
    _getListSofUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: AppColors.primary_background,
      body: Column(
        children: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is GetListSofError) {
                setState(() {
                  _isGlobalLoading = false;
                });
                ToastManager.showNotificationToast(
                    type: ToastType.Error, msg: "Get Sof Users failed");
              }

              if (state is CombineBookmarkSuccess) {
                setState(() {
                  _isGlobalLoading = false;
                  _hasMore = state.data.hasMore;
                });
                _listSofUserListenable.value = state.data.listSofUser;
              }
            },
            child: _isGlobalLoading
                ? const CustomListSkeleton()
                : ValueListenableBuilder(
                    valueListenable: _listSofUserListenable,
                    builder: (context, error, child) {
                      return _buildListUsers(
                        hasMore: _hasMore,
                        listSofUsers: _listSofUserListenable.value,
                      );
                    }),
          )
        ],
      ),
    );
  }

  Widget _buildListUsers(
      {required List<UserModel> listSofUsers, required bool hasMore}) {
    Log.d("_buildListUsers");
    if (listSofUsers.isEmpty) {
      return const CustomEmpty();
    }

    return Expanded(
      child: CustomScrollBar(
        child: SeperatedListView(
            hasMore: hasMore,
            onScrollToEnd: _getListSofUser,
            itemCount: listSofUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return SofUserRow(
                onBookmarkUser: () => _onBookmarkUser(listSofUsers[index]),
                user: listSofUsers[index],
              );
            }),
      ),
    );
  }
}
