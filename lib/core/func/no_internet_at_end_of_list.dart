// create method that check if no internet at end of list;
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/custom_snack_bar.dart';

import '../cubits/cubit/check_internnet_connection_cubit.dart';

void noInternetConnectionAtendOfList({required BuildContext context, required ScrollController scrollController}) {
  final currentScroll = scrollController.position.pixels;
  final maxScroll = scrollController.position.maxScrollExtent;
  final bool isInternetConnceted = BlocProvider.of<InternetConnectionCubit>(context).state is InternetConnectionSuccess;
  if (currentScroll == maxScroll && isInternetConnceted == false) {
    showAnimatedSnackBar(
      context,
      message: "No Internet Connection",
      type: AnimatedSnackBarType.error,
    );
  }
  
}