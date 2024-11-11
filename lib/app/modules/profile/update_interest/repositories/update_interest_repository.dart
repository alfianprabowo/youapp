import 'package:flutter/material.dart';

import '../../../../../../config/network/response_status.dart';
import '../../../../../../config/network/services.dart';
import '../../../../data/models/user.dart';

abstract class IUpdateInterestRepository {
  Future<ResponseStatus> updateInterest(User user);
}

class UpdateInterestRepository implements IUpdateInterestRepository {
  BuildContext context;
  UpdateInterestRepository(this.context);

  @override
  Future<ResponseStatus> updateInterest(User user) async {
    return await Network(context).updateInterest(user);
  }
}
