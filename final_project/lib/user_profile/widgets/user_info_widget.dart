import 'package:final_project/data/user.dart';
import 'package:final_project/user_profile/widgets/profile_background_painter.dart';
import 'package:final_project/user_profile/widgets/user_statistic_widget.dart';
import 'package:flutter/material.dart';

import 'change_username_widget.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget(
      {Key? key, required User userData, required Function onSave})
      : _onSave = onSave,
        _userData = userData,
        super(key: key);

  final User _userData;
  final Function _onSave;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        CustomPaint(
          size: Size(size.width * 0.8, 340),
          painter: ProfileBackgroundPainter(
            Theme.of(context).colorScheme.primary,
          ),
        ),
        Column(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFF6B7F99),
              radius: 70,
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        _userData.name ?? 'User${_userData.id}',
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: 20,
                        height: 30,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ChangeUsernameWidget(
                                onSave: _onSave,
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _userData.phoneNumber!,
                    style: theme.textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            UserStatisticWidget(userData: _userData),
          ],
        ),
      ],
    );
  }
}
