part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {
}

final class  AuthTabCubit extends AuthState{
  final bool isSignup;

  AuthTabCubit({required this.isSignup});
}