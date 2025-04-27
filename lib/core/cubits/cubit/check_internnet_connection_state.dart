part of 'check_internnet_connection_cubit.dart';

@immutable
sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnectionSuccess extends InternetConnectionState {
  final List<ConnectivityResult> connected;

  InternetConnectionSuccess({required this.connected});
}

final class InternetConnectionFailure extends InternetConnectionState {}
