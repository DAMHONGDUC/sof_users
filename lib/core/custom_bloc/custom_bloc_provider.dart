import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';
import 'package:sof_users/app/screens/user_detail/bloc/user_detail_bloc.dart';
import 'package:sof_users/core/di/injection_container.dart';

class CustomBlocProvider extends StatelessWidget {
  const CustomBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider<UserDetailBloc>(
          create: (context) => getIt<UserDetailBloc>(),
        ),
      ],
      child: child,
    );
  }
}
