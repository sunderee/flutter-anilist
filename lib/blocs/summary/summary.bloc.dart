import 'package:c2sanilist/api/repositories/summary.repository.dart';
import 'package:c2sanilist/blocs/summary/summary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final SummaryRepository _repository = SummaryRepository.instance();

  SummaryBloc() : super(SummaryState.loading());

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if (event is RetrieveSummaryEvent) {
      yield SummaryState.loading();
      final data = await _repository.fetchSummary(
        event.pageNumber,
        event.perPage,
      );
      if (data.isNotEmpty) {
        yield SummaryState.successful(data);
      } else {
        yield SummaryState.failed('Could not retrieve any items');
      }
    } else {
      yield SummaryState.failed('Unknown error');
    }
  }
}
