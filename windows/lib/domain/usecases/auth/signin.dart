import 'package:dartz/dartz.dart';
import 'package:Payirseai/data/core/usecase/usecase.dart';

import 'package:Payirseai/data/models/auth/signin_user_req.dart';
import 'package:Payirseai/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements Usecase<Either,SigninUserReq>{
  @override
  Future<Either> call({SigninUserReq ? params}) {
    return sl<AuthRepository>().signin(params!);
  }

}