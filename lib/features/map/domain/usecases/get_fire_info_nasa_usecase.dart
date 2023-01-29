import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:free_fire_location/core/error/failures.dart';
import 'package:free_fire_location/core/usecase/usecase.dart';
import 'package:free_fire_location/features/map/domain/entities/fire_page_entity.dart';
import 'package:free_fire_location/features/map/domain/repositories/fire_info_repository.dart';

class GetFireInfoNasaUsecase
    implements UseCase<FirePageEntity, GetFireInfoParams> {
  GetFireInfoNasaUsecase({required this.repository});
  final FireInfoRepository repository;

  @override
  Future<Either<Failure, FirePageEntity>> call(
    GetFireInfoParams params,
  ) async {
    return repository.getFireLocationsNasa(
      amount: params.amount,
    );
  }
}

class GetFireInfoParams extends Equatable {
  const GetFireInfoParams({
    required this.amount,
  });
  final int amount;

  @override
  List<Object> get props => [amount];
}
