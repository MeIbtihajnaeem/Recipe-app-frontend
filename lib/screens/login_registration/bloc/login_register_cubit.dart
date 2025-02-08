import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rest_api/rest_api.dart';

part 'login_register_state.dart';

class LoginRegisterCubit extends HydratedCubit<LoginRegisterState> {
  final AuthController authController;
  LoginRegisterCubit(this.authController) : super(LoginRegisterState.empty());

  Future<void> loginUser(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      emit(state.copyWith(showError: false, error: ""));
      UserModel? user = await authController.loginOrRegister(
          userName: userName, email: email, password: password, login: true);
      emit(state.copyWith(user: user));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), showError: true));
    }
  }

  Future<void> registerUser(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      emit(state.copyWith(showError: false, error: ""));
      UserModel? user = await authController.loginOrRegister(
          userName: userName, email: email, password: password, login: false);
      emit(state.copyWith(user: user));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), showError: true));
    }
  }

  @override
  LoginRegisterState? fromJson(Map<String, dynamic> json) {
    return LoginRegisterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LoginRegisterState state) {
    return {"user": state.user?.toJson()};
  }
}
