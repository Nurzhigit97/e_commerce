import 'package:e_commerce/shared/core/resources/data/data_state.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<DataState<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
