import 'package:dartz/dartz.dart';
import 'package:Payirseai/data/core/usecase/usecase.dart';
import 'package:Payirseai/data/models/auth/create_user_req.dart';
import 'package:Payirseai/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements Usecase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq ? params}) {
    return sl<AuthRepository>().signup(params!);
  }

}