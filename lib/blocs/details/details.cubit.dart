import 'package:c2sanilist/api/repositories/details.repository.dart';
import 'package:c2sanilist/blocs/details/details.state.dart';
import 'package:c2sanilist/config/dependencies.config.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final IDetailsRepository _repository;

  DetailsCubit()
      : _repository = getIt.get<IDetailsRepository>(),
        super(DetailsState.loading());

  Future<void> retrieveDetails(int mediaID) async {
    try {
      final details = await _repository.fetchMedia(mediaID);
      emit(DetailsState.successful(details));
    } on ApiException catch (e) {
      emit(DetailsState.failed(e.toString()));
    } catch (e) {
      emit(DetailsState.failed('Unknown application error'));
    }
  }
}
