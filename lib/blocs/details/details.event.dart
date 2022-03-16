import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
abstract class DetailsEvent extends Equatable {
  const DetailsEvent._();

  @protected
  const factory DetailsEvent.retrieve(int mediaID) = RetrieveDetailsEvent;
}

class RetrieveDetailsEvent extends DetailsEvent {
  final int mediaID;

  const RetrieveDetailsEvent(this.mediaID) : super._();

  @override
  List<Object?> get props => [mediaID];
}
