import 'package:flutter/material.dart';

import '../../data/user.dart';

class UserStatisticWidget extends StatelessWidget {
  const UserStatisticWidget({Key? key, required User userData})
      : _userData = userData,
        super(key: key);

  final User _userData;

  _calculateTimeSinceRegister() {
    return (DateTime.now().millisecondsSinceEpoch / 1000 -
            _userData.createdAt!) /
        3600 /
        24;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _calculateTimeSinceRegister().ceil().toString(),
                    style: theme.textTheme.displayLarge,
                  ),
                  Text(
                    'days',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              width: 40,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (_userData.tickets!.data?.length ?? 0).toString(),
                    style: theme.textTheme.displayLarge,
                  ),
                  Text(
                    'tickets',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
