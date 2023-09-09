part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class loginloadingstate extends AuthState {}

class loginsucssesstate extends AuthState {}

class loginerrorstate extends AuthState {}