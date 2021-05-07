import 'package:c2sanilist/api/models/details.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
abstract class DetailsState extends Equatable {
  const DetailsState._();

  @protected
  factory DetailsState.loading() = LoadingDetailsState;

  @protected
  factory DetailsState.successful(
    DetailsModel data,
  ) = SuccessfulDetailsState;

  @protected
  factory DetailsState.failed(
    String error,
  ) = FailedDetailsState;
}

class LoadingDetailsState extends DetailsState {
  const LoadingDetailsState() : super._();

  @override
  List<Object?> get props => [];
}

class SuccessfulDetailsState extends DetailsState {
  final DetailsModel data;

  const SuccessfulDetailsState(this.data) : super._();

  @override
  List<Object?> get props => [data];
}

class FailedDetailsState extends DetailsState {
  final String error;

  const FailedDetailsState(this.error) : super._();

  @override
  List<Object?> get props => [error];
}
