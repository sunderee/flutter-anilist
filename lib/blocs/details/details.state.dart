import 'package:c2sanilist/api/models/details.model.dart';
import 'package:c2sanilist/blocs/status.enum.dart';
import 'package:equatable/equatable.dart';

class DetailsState extends Equatable {
  final StatusEnum status;
  final DetailsModel? data;
  final String? errorMessage;

  const DetailsState({
    required this.status,
    this.data,
    this.errorMessage,
  });

  factory DetailsState.loading() => const DetailsState(
        status: StatusEnum.loading,
      );

  factory DetailsState.successful(DetailsModel details) => DetailsState(
        status: StatusEnum.successful,
        data: details,
      );

  factory DetailsState.failed(String errorMessage) => DetailsState(
        status: StatusEnum.failed,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [status, data, errorMessage];
}
