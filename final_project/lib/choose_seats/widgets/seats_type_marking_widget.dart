import 'package:flutter/material.dart';

class SeatsTypeMarkingWidget extends StatelessWidget {
  const SeatsTypeMarkingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(child: SizedBox()),
            Container(
              width: 10,
              height: 10,
              color: Colors.blueAccent,
            ),
            Text(
              ' - normal',
              style: theme.textTheme.bodySmall,
            ),
            const Expanded(child: SizedBox()),
            Container(
              width: 10,
              height: 10,
              color: Colors.limeAccent,
            ),
            Text(
              ' - middle',
              style: theme.textTheme.bodySmall,
            ),
            const Expanded(child: SizedBox()),
            Container(
              width: 10,
              height: 10,
              color: Colors.deepPurpleAccent,
            ),
            Text(
              ' - VIP',
              style: theme.textTheme.bodySmall,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Expanded(child: SizedBox()),
            Container(
              width: 10,
              height: 10,
              color: Colors.grey,
            ),
            Text(
              ' - sold',
              style: theme.textTheme.bodySmall,
            ),
            const Expanded(child: SizedBox()),
            Container(
              width: 10,
              height: 10,
              color: theme.colorScheme.secondary,
            ),
            Text(
              ' - in cart',
              style: theme.textTheme.bodySmall,
            ),
            const Expanded(child: SizedBox()),
          ],
        )
      ],
    );
  }
}
