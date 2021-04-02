import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/error/failures.dart';
import 'package:flutter_clean_architecture_bloc/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_bloc/screens/change_password/domain/repositories/change_password_repository.dart';

class ChangePassword extends UseCase<bool,ChangePasswordParams>{
  final ChangePasswordRepository repository;

  ChangePassword({this.repository});

  @override
  Future<Either<Failure, bool>> call(ChangePasswordParams params) {
    return repository.changePassword(params.oldPassword, params.newPassword);
  }
}

class ChangePasswordParams extends Equatable{
  final String oldPassword;
  final String newPassword;

  ChangePasswordParams({@required this.oldPassword, @required this.newPassword});
}