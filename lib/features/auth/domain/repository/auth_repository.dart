import 'package:dex_pr/core/data/remote_response.dart';
import 'package:dex_pr/core/domain/app_error/app_error.dart';
import 'package:dex_pr/core/domain/use_case_result/use_case_result.dart';
import 'package:dex_pr/features/auth/data/model/auth_credentials.dart';
import 'package:dex_pr/features/auth/data/source/auth_data.dart';
import 'package:dex_pr/features/auth/domain/entity/auth_credentials.dart';
import 'package:dex_pr/util/rest_api_error_list_ext.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<UseCaseResult<AuthCredentials>> signIn({
    required final String phone,
    required final String password,
  }) async {
    final sourceResult =
    await _authDataSource.signIn(phone: phone, password: password);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
          UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
      const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
          UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}