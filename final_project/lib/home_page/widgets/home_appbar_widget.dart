import 'package:final_project/home_page/bloc/search_query_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppbarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<HomeAppbarWidget> createState() => _HomeAppbarWidgetState();
}

class _HomeAppbarWidgetState extends State<HomeAppbarWidget> {
  bool _showSearchField = false;
  late DateTime _sessionsDate;

  @override
  void initState() {
    _sessionsDate = DateTime.now();
    super.initState();
  }

  _selectSessionsDate() async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _sessionsDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(_sessionsDate.year, 12));
    if (picked != null && picked != _sessionsDate) {
      _sessionsDate = picked;
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.wallet_outlined),
          );
        },
      ),
      title: (_showSearchField)
          ? TextField(
              autofocus: true,
              onTapOutside: (event) {
                setState(() {
                  _showSearchField = false;
                });
              },
              onSubmitted: (text) {
                context.read<SearchQueryBloc>().add(
                      SendSearchRequestEvent(
                        searchQuery: text,
                      ),
                    );
              },
              cursorColor: theme.colorScheme.onBackground,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Search',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
            )
          : null,
      actions: [
        Builder(builder: (context) {
          if (!_showSearchField) {
            return IconButton(
              onPressed: () {
                setState(() {
                  _showSearchField = true;
                });
              },
              icon: const Icon(Icons.search),
            );
          }
          return const SizedBox();
        }),
        IconButton(
          onPressed: () {
            _selectSessionsDate().then(
              (result) {
                if (result) {
                  context.read<SearchQueryBloc>().add(
                        SendSearchRequestEvent(
                          searchDate: _sessionsDate,
                        ),
                      );
                }
              },
            );
          },
          icon: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }
}
