import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/models/user.dart';
import 'package:flutter_cubit/repository/user_repository.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());

  Future<void> getUserDetails() async {
    try {
      emit(UserLoading());
      final user = await _userRepository.fetchUserData();
      emit(UserLoaded(user));
    } on NetworkException {
      emit(UserError("No Internet connection!!"));
    }
  }
}
