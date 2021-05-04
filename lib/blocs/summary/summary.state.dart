import 'package:c2sanilist/api/models/summary.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
abstract class SummaryState extends Equatable {
  const SummaryState._();

  @protected
  factory SummaryState.loading() = LoadingSummaryState;

  @protected
  factory SummaryState.successful(
    List<SummaryModel> data,
  ) = SuccessfulSummaryState;

  @protected
  factory SummaryState.failed(
    String error,
  ) = FailedSummaryState;
}

class LoadingSummaryState extends SummaryState {
  const LoadingSummaryState() : super._();

  @override
  List<Object?> get props => [];
}

class SuccessfulSummaryState extends SummaryState {
  final List<SummaryModel> data;

  const SuccessfulSummaryState(this.data) : super._();

  @override
  List<Object?> get props => [data];
}

class FailedSummaryState extends SummaryState {
  final String error;

  const FailedSummaryState(this.error) : super._();

  @override
  List<Object?> get props => [error];
}
