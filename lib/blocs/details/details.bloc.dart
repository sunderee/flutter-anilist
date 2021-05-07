import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/blocs/details/details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  @internal
  final DetailsRepository repository;

  DetailsBloc({
    required this.repository,
  }) : super(DetailsState.loading());

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is RetrieveDetailsEvent) {
      yield DetailsState.loading();
      final data = await repository.fetchMedia(event.mediaID);
      if (data != null) {
        yield DetailsState.successful(data);
      } else {
        yield DetailsState.failed('Could not retrieve media details');
      }
    } else {
      yield DetailsState.failed('Unknown error');
    }
  }
}
