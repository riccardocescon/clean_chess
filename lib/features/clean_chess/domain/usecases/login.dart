import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/core/usecases/usecase.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/net_login_data.dart';
import 'package:clean_chess/features/clean_chess/domain/repositories/net_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// This class is responsible for Analyzing and Validating the response
/// received from the [NetRepositoryImpl] and returning either a [Failure]
/// or a Model requested by the [Bloc]
class Login implements UseCase<Account, LoginParams> {
  final NetRepository netRepository;

  const Login(this.netRepository);

  @override
  Future<Either<Failure, Account>> call(LoginParams params) async {
    final response =
        await netRepository.login(params.username, params.password);

    if (response.isLeft()) return Left(response.left);

    //TODO: Analyze and validate response

    final account = Account.fromJson(response.right);

    return Right(account);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
