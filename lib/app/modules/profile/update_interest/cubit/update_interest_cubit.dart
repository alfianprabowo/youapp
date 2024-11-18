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

  Future<void> updateInterest(User data) async {
    emit(LoadingUpdateInteresState());

    try {
      final ResponseStatus response = await iUpdateInterestRepository.updateProfile(data);
      if (response.data != null && response.data.isNotEmpty && response.message == "Profile has been updated successfully") {
        emit(SuccessUpdateInteresState());
      } else {
        emit(FailureUpdateInterestState(response.message ?? ""));
      }
    } catch (e) {
      if (!isClosed) {
        emit(FailureUpdateInterestState(e.toString()));
      }
    }
  }
}
