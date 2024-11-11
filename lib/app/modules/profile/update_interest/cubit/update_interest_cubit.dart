import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../../../config/network/response_status.dart';
import '../../../../data/models/user.dart';
import '../repositories/update_interest_repository.dart';
import 'update_interest_state.dart';

class UpdateInterestCubit extends Cubit<UpdateInterestState> {
  final IUpdateInterestRepository iUpdateInterestRepository;

  UpdateInterestCubit(
    this.iUpdateInterestRepository,
  ) : super(InitialUpdateInterestState());

  Future<User> updateInterest() async {
    User userData = const User();
    final ResponseStatus response = await iUpdateInterestRepository.updateInterest(userData);
    if (response.data != null && response.data.isNotEmpty) {
      Map<String, dynamic> l = jsonDecode(jsonEncode(response.data));
      userData = User.fromJson(l);
    }
    return userData;
  }
}
