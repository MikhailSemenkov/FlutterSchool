import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../splash_screen/painter/logo_painter.dart';
import '../bloc/authorization_bloc.dart';

class RedirectToAuthorizationScreen extends StatelessWidget {
  const RedirectToAuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text(
            'You`re almost there',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Expanded(
            child: Center(
              child: CustomPaint(
                painter: LogoPainter(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: Text(
              'To use this application you need to authorize',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    dotenv.load(fileName: 'API.env').then(
                          (value) => Navigator.of(context)
                              .pushNamed('/authorization',
                                  arguments: dotenv.env['id'])
                              .then(
                                (value) => context
                                    .read<AuthorizationBloc>()
                                    .add(
                                      UserPermittedAuthorizationEvent(
                                        authorizationRequest: value! as String,
                                      ),
                                    ),
                              ),
                        );
                  },
                  child: Text(
                    'Authorization',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
