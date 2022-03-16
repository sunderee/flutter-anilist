import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:c2sanilist/blocs/summary/summary.event.dart';
import 'package:c2sanilist/blocs/summary/summary.state.dart';
import 'package:c2sanilist/config/dependencies.config.dart';
import 'package:c2sanilist/utils/exceptions/api.exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ISummaryRepository _repository;

  SummaryBloc()
      : _repository = getIt.get<ISummaryRepository>(),
        super(SummaryState.loading()) {
    on<RetrieveSummaryEvent>(_onRetrieveSummaryEvent);
  }

  Future<void> _onRetrieveSummaryEvent(
    RetrieveSummaryEvent event,
    Emitter<SummaryState> emit,
  ) async {
    emit(SummaryState.loading());
    try {
      final summaries = await _repository.fetchSummary(
        event.pageNumber,
        event.perPage,
      );
      emit(SummaryState.successful(summaries));
    } on ApiException catch (e) {
      emit(SummaryState.failed(e.toString()));
    } catch (e) {
      emit(SummaryState.failed('Unknown application error'));
    }
  }
}
