import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/app/widgets/custom_list_divider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sof_users/core/resources/app_box_model.dart';
import 'package:sof_users/core/resources/app_colors.dart';

// class SeperatedListView extends StatelessWidget {
//   final int itemCount;
//   final Widget? Function(BuildContext, int) itemBuilder;

//   final ScrollController? scrollController;

//   const SeperatedListView(
//       {super.key,
//       required this.itemCount,
//       required this.itemBuilder,
//       this.scrollController});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       controller: scrollController,
//       child: Column(
//         children: [
//           ListView.separated(
//               physics: const NeverScrollableScrollPhysics(),
//               separatorBuilder: (context, index) {
//                 return const CustomListDivider();
//               },
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount: itemCount,
//               itemBuilder: itemBuilder),
//           true
//               ? Container(
//                   padding: EdgeInsets.all(AppBoxModel.mainPadding()),
//                   child: LoadingAnimationWidget.threeRotatingDots(
//                     color: AppColors.primary_light,
//                     size: 24.sp,
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }

class SeperatedListView extends StatefulWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollController? customScrollController;
  final VoidCallback? onScrollToEnd;

  const SeperatedListView(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.onScrollToEnd,
      this.customScrollController});

  @override
  State<SeperatedListView> createState() => _SeperatedListViewState();
}

class _SeperatedListViewState extends State<SeperatedListView> {
  late ScrollController _scrollController;
  // final ValueNotifier<bool> _loadingListenable = ;

  void _handleScrolling() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        widget.onScrollToEnd != null) {
      widget.onScrollToEnd!();
    }
  }

  @override
  void initState() {
    _scrollController = widget.customScrollController ?? ScrollController();
    _scrollController.addListener(_handleScrolling);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScrolling);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder),
          true
              ? Container(
                  padding: EdgeInsets.all(AppBoxModel.mainPadding()),
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: AppColors.primary_light,
                    size: 24.sp,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
    return const Placeholder();
  }
}
