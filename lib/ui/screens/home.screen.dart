import 'package:c2sanilist/blocs/status.enum.dart';
import 'package:c2sanilist/blocs/summary/summary.bloc.dart';
import 'package:c2sanilist/blocs/summary/summary.event.dart';
import 'package:c2sanilist/blocs/summary/summary.state.dart';
import 'package:c2sanilist/ui/widgets/summary.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('C2SAniList'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<SummaryBloc, SummaryState>(
            builder: (BuildContext context, SummaryState state) {
              if (state.status == StatusEnum.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == StatusEnum.failed) {
                return Center(child: Text(state.errorMessage ?? 'Unknown'));
              } else if (state.status == StatusEnum.successful) {
                return RefreshIndicator(
                  onRefresh: () {
                    BlocProvider.of<SummaryBloc>(context)
                        .add(const RetrieveSummaryEvent(1, 50));
                    return Future.delayed(const Duration(milliseconds: 150));
                  },
                  child: ListView.separated(
                    itemCount: state.data.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                    itemBuilder: (_, int index) => SummaryWidget(
                      data: state.data[index],
                    ),
                  ),
                );
              } else {
                return const Center(child: Text('Application error'));
              }
            },
          ),
        ),
      );
}
