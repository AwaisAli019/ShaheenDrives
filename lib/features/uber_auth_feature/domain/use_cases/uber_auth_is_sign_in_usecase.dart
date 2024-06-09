import 'package:shaheendrive/features/uber_auth_feature/domain/repositories/uber_auth_repository.dart';

class UberAuthIsSignInUseCase {
  final UberAuthRepository uberAuthRepository;

  UberAuthIsSignInUseCase({required this.uberAuthRepository});

  Future<bool> call() async {
    return await uberAuthRepository.uberAuthIsSignIn();
  }
}
