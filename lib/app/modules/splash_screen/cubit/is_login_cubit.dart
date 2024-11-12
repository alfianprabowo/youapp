import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/modules/splash_screen/cubit/is_login_state.dart';
import 'package:youapp/app/utils/constants/app_const.dart';

import '../../../../config/environment/secure_storage_service.dart';

class IsLoginCubit extends Cubit<IsLoginState> {
  IsLoginCubit() : super(InitialLoginState()) {
    isLogin();
  }
  void isLogin() async {
    emit(LoadingLoginState());

    var useMasterToken = await readByKey(loginAccessToken);
    if (useMasterToken == null) {
      Future.delayed(const Duration(seconds: 2), () {
        emit(ResultLoginState(false));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        emit(ResultLoginState(true));
      });
    }
  }
}
