import 'package:dex_pr/core/data/remote_response.dart';
import 'package:dex_pr/features/auth/data/model/auth_credentials.dart';

abstract interface class AuthDataSource {
  Future<RemoteResponse<AuthCredentialsModel>> signIn({
    required final String phone,
    required final String password,
  });

  Future<RemoteResponse<AuthCredentialsModel>> signUp({
    required final String phone,
    required final String password,
  });
}