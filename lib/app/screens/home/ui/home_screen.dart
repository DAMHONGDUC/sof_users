import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';
import 'package:sof_users/app/screens/home/ui/sof_user_row.dart';
import 'package:sof_users/app/screens/user_detail/ui/user_detail_screen.dart';
import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/app/utils/toast_manager.dart';
import 'package:sof_users/app/widgets/custom_app_bar.dart';
import 'package:sof_users/app/widgets/custom_list_skeleton.dart';
import 'package:sof_users/app/widgets/custom_refresh.dart';
import 'package:sof_users/app/widgets/custom_scroll_bar.dart';
import 'package:sof_users/app/widgets/custom_switch.dart';
import 'package:sof_users/app/widgets/item_spacing.dart';
import 'package:sof_users/app/widgets/seperated_list_view.dart';
import 'package:sof_users/app/widgets/custom_empty.dart';
import 'package:sof_users/core/constants/app_enum.dart';
import 'package:sof_users/core/navigation/app_router.dart';
import 'package:sof_users/core/navigation/navigation_manager.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_text_style.dart';
import 'package:sof_users/domain/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  bool _onlyShowBookmark = false;

  void _handleRefresh() async {
    context.read<HomeBloc>().add(RefreshEvent());
  }

  void _handleToggleBookmark(UserModel user) {
    context.read<HomeBloc>().add(ToggleBookmarkEvent(user: user));
  }

  void _handleLoadMore() {
    context.read<HomeBloc>().add(LoadMoreEvent());
  }

  void _navToUserDetail(UserModel user) {
    NavigationManager.router.push(AppRouter.USER_DETAIL.location,
        extra: UserDetailArgs(userId: user.id, userName: user.displayName));
  }

  Future<void> _onRefresh() async {
    if (!_onlyShowBookmark) {
      _handleRefresh();
    }
  }

  void _onSwitchOnlyShowBookmark(bool newValue) {
    setState(() {
      _onlyShowBookmark = newValue;
    });
  }

  @override
  void initState() {
    // get list user on init
    _handleRefresh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        actions: [
          Row(
            children: [
              Text(
                "Only bookmark",
                style: AppTextStyle.small().copyWith(color: AppColors.white),
              ),
              const HorizontalSpacing(),
              CustomSwitch(
                  onChanged: _onSwitchOnlyShowBookmark,
                  value: _onlyShowBookmark),
              const HorizontalSpacing(),
            ],
          )
        ],
      ),
      backgroundColor: AppColors.primary_background,
      body: CustomRefresh(
        onRefresh: _onRefresh,
        child: Column(
          children: [
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeError) {
                  ToastManager.showNotificationToast(
                      type: ToastType.Error,
                      msg: "Home Error: ${state.data.error}");
                }
              },
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) {
                  return current is RefreshLoading ||
                      current is CombineBookmarkSuccess;
                },
                builder: (context, state) {
                  if (state is RefreshLoading) {
                    return const CustomListSkeleton();
                  }

                  if (state is CombineBookmarkSuccess) {
                    return _buildListUsers(
                      hasMore: state.data.hasMore,
                      onlyShowBookmark: _onlyShowBookmark,
                      listSofUsers: state.data.listSofUser,
                      listBookmarks: state.data.listBookmarks,
                    );
                  }

                  return const CustomEmpty();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListUsers(
      {required List<UserModel> listSofUsers,
      required List<UserModel> listBookmarks,
      required bool hasMore,
      required bool onlyShowBookmark}) {
    Log.d("_buildListUsers");
    final renderList = onlyShowBookmark ? listBookmarks : listSofUsers;

    if (renderList.isEmpty) {
      return const CustomEmpty();
    }

    return Expanded(
      child: CustomScrollBar(
        child: SeperatedListView(
            key: PageStorageKey(
                "list_sof_user_${_onlyShowBookmark ? 'bookmark' : 'all'}"),
            hasMore: onlyShowBookmark ? false : hasMore,
            onScrollToEnd: _handleLoadMore,
            itemCount: renderList.length,
            itemBuilder: (BuildContext context, int index) {
              final user = renderList[index];

              return SofUserRow(
                onTap: () => _navToUserDetail(user),
                onToggleBookmark: () => _handleToggleBookmark(user),
                user: user,
              );
            }),
      ),
    );
  }
}
