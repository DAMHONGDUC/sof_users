import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/features/home/bloc/home_bloc.dart';
import 'package:sof_users/injection_container.dart';

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
      ],
      child: child,
    );
  }
}
