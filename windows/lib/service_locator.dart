import 'package:get_it/get_it.dart';
import 'package:Payirseai/data/repository/auth/auth_repository_impl.dart';
import 'package:Payirseai/data/sources/auth/auth_firebase_service.dart';
import 'package:Payirseai/domain/repository/auth/auth.dart';
import 'package:Payirseai/domain/usecases/auth/signin.dart';
import 'package:Payirseai/domain/usecases/auth/signup.dart';

final sl =GetIt.instance;

Future<void> initializeDeoendencies() async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

}