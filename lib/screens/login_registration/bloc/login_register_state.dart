part of 'login_register_cubit.dart';

class LoginRegisterState extends Equatable {
  final UserModel? user;
  final String error;
  final bool showError;

  const LoginRegisterState({
    required this.user,
    required this.error,
    required this.showError,
  });

  static LoginRegisterState empty() {
    return const LoginRegisterState(user: null, error: "", showError: false);
  }

  LoginRegisterState copyWith(
          {UserModel? user, String? error, bool? showError}) =>
      LoginRegisterState(
          user: user ?? this.user,
          error: error ?? this.error,
          showError: showError ?? this.showError);

  factory LoginRegisterState.fromMap(Map<String, dynamic> json) =>
      LoginRegisterState(
          user: UserModel.fromJson(json), error: "", showError: false);

  @override
  List<Object?> get props => [user, error, showError];
}
