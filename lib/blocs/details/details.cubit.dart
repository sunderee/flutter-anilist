import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/blocs/details/details.state.dart';
import 'package:c2sanilist/config/dependencies.config.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:c2sanilist/utils/helpers/loggers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> with BlocLoggy {
  final IDetailsRepository _repository;

  DetailsCubit()
      : _repository = getIt.get<IDetailsRepository>(),
        super(DetailsState.loading());

  Future<void> retrieveDetails(int mediaID) async {
    loggy.info('Retrieve details for $mediaID');

    emit(DetailsState.loading());
    try {
      final details = await _repository.fetchMedia(mediaID);
      emit(DetailsState.successful(details));
    } on ApiException catch (e) {
      loggy.error(e.toString(), e);
      emit(DetailsState.failed(e.toString()));
    } catch (e) {
      loggy.error(e.toString(), e);
      emit(DetailsState.failed('Unknown application error'));
    }
  }
}
