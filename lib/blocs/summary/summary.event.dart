import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
abstract class SummaryEvent extends Equatable {
  const SummaryEvent._();

  @protected
  const factory SummaryEvent.retrieve(
    int page,
    int perPage,
  ) = RetrieveSummaryEvent;
}

class RetrieveSummaryEvent extends SummaryEvent {
  final int pageNumber;
  final int perPage;

  const RetrieveSummaryEvent(
    this.pageNumber,
    this.perPage,
  ) : super._();

  @override
  List<Object?> get props => [pageNumber, perPage];
}
