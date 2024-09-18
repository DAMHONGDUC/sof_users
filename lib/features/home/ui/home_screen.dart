import 'package:flutter/material.dart';
import 'package:sof_users/features/home/bloc/home_bloc.dart';
import 'package:sof_users/injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = getIt<HomeBloc>();

  void _getListSofUser() {
    _homeBloc
        .add(GetListSofEvent(page: 1, pageSize: 30, site: "stackoverflow"));
  }

  @override
  void initState() {
    _getListSofUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text("HomeScreen"),
        ),
      ),
    );
  }
}
