import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

part 'check_internnet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit(this._connectivity)
      : super(InternetConnectionInitial());

  // create method that check internet connection;
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;
  void checkInternetConnection() {
    connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      log("Internet Connection cubit= $result");
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        emit(
          InternetConnectionSuccess(connected: result),
        );
      } else if (result.contains(ConnectivityResult.none)) {
        emit(InternetConnectionFailure());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
