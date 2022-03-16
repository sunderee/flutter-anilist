import 'package:c2sanilist/blocs/summary/summary.dart';
import 'package:c2sanilist/ui/widgets/summary.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('C2SAniList'),
        ),
        body: BlocBuilder<SummaryBloc, SummaryState>(
          builder: (BuildContext cntx, SummaryState state) {
            if (state is LoadingSummaryState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FailedSummaryState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is SuccessfulSummaryState) {
              return RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<SummaryBloc>(cntx)
                      .add(RetrieveSummaryEvent(1, 50));
                  return Future.delayed(Duration(milliseconds: 50));
                },
                child: SafeArea(
                  minimum: const EdgeInsets.only(top: 16.0),
                  child: ListView.separated(
                    itemCount: state.data.length,
                    itemBuilder: (_, int index) => SummaryWidget(
                      data: state.data[index],
                    ),
                    separatorBuilder: (_, __) => SizedBox(
                      height: 16.0,
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('Application error, ${state.runtimeType}'),
              );
            }
          },
        ),
      );
}
