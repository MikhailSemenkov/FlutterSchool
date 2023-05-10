import 'package:final_project/detail_page/widgets/sessions_list_date_selector_widget.dart';
import 'package:final_project/detail_page/widgets/sessions_list_tile_widget.dart';
import 'package:final_project/error_screen/screens/error_screen.dart';
import 'package:final_project/loading_screen/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../api_client/api_client.dart';
import '../../data/movies.dart';

class SessionsListWidget extends StatefulWidget {
  const SessionsListWidget({Key? key, required Movie movie})
      : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  State<SessionsListWidget> createState() => _SessionsListWidgetState();
}

class _SessionsListWidgetState extends State<SessionsListWidget> {
  late Future _future;
  final formatter = DateFormat('yyyy-MM-dd');
  DateTime _sessionsDate = DateTime.now();

  @override
  void initState() {
    _future = APIClient().listOfSessions(
      widget._movie.id.toString(),
      formatter.format(_sessionsDate),
    );
    super.initState();
  }

  _reloadWidgetData(DateTime sessionsDate) {
    _sessionsDate = sessionsDate;
    setState(() {
      _future = APIClient().listOfSessions(
        widget._movie.id.toString(),
        formatter.format(sessionsDate),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SessionsListDateSelectorWidget(
                  reloadWidgetData: _reloadWidgetData,
                ),
                Expanded(
                  child: ListView(
                    children: List.generate(
                      snapshot.data!.data!.length,
                      (index) => SessionsListTileWidget(
                        session: snapshot.data!.data![index],
                        movie: widget._movie,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            return ErrorScreen(
              onPressed: () {
                _reloadWidgetData(_sessionsDate);
              },
              message: 'Can not get sessions list',
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
