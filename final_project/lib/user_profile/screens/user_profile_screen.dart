import 'package:final_project/api_client/api_client.dart';
import 'package:final_project/loading_screen/screens/loading_screen.dart';
import 'package:final_project/user_profile/widgets/tickets_list_widget.dart';
import 'package:final_project/user_profile/widgets/user_info_widget.dart';
import 'package:flutter/material.dart';

import '../../data/user.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late Future<User> _future;

  @override
  void initState() {
    _future = APIClient().currentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.colorScheme.background,
      child: SafeArea(
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  UserInfoWidget(
                    userData: snapshot.data!,
                    onSave: () {
                      setState(() {
                        _future = APIClient().currentUser();
                      });
                    },
                  ),
                  Expanded(
                    child: TicketsListWidget(
                      tickets: snapshot.data!.tickets!.data!,
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Something went wrong')],
                ),
              );
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
