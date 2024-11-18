import 'package:flutter/material.dart';
import 'package:youapp/app/data/models/interest_list.dart';

import '../../../../../../config/network/response_status.dart';
import '../../../../../../config/network/services.dart';
import '../../../../data/models/user.dart';

abstract class IUpdateInterestRepository {
  Future<ResponseStatus> updateProfile(User data);
}

class UpdateInterestRepository implements IUpdateInterestRepository {
  BuildContext context;
  UpdateInterestRepository(this.context);

  @override
  Future<ResponseStatus> updateProfile(User data) async {
    return await Network(context).updateProfile(data);
  }
}
