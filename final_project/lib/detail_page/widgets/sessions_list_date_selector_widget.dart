import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionsListDateSelectorWidget extends StatefulWidget {
  const SessionsListDateSelectorWidget(
      {Key? key, required Function reloadWidgetData})
      : _reloadWidgetData = reloadWidgetData,
        super(key: key);

  final Function _reloadWidgetData;

  @override
  State<SessionsListDateSelectorWidget> createState() =>
      _SessionsListDateSelectorWidgetState();
}

class _SessionsListDateSelectorWidgetState
    extends State<SessionsListDateSelectorWidget> {
  DateTime _sessionsDate = DateTime.now();

  _nextSessionsDate() {
    _sessionsDate = _sessionsDate.add(const Duration(days: 1));
    widget._reloadWidgetData(_sessionsDate);
  }

  _prevSessionsDate() {
    _sessionsDate = _sessionsDate.subtract(const Duration(days: 1));
    widget._reloadWidgetData(_sessionsDate);
  }

  _selectSessionsDate() async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _sessionsDate,
        firstDate: DateTime(_sessionsDate.year),
        lastDate: DateTime(_sessionsDate.year, 12));
    if (picked != null && picked != _sessionsDate) {
      _sessionsDate = picked;
      widget._reloadWidgetData(_sessionsDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formatter = DateFormat('yyyy-MM-dd');

    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              _prevSessionsDate();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: theme.colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: TextButton(
              onPressed: () {
                _selectSessionsDate();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatter.format(_sessionsDate),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {
              _nextSessionsDate();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
