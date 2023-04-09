import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/liked_songs/bloc/compositions_bloc.dart';
import 'package:lesson7/liked_songs/widgets/liked_songs_list_view_top_widget.dart';
import 'package:lesson7/navigation_bar/screens/navigation_bar.dart';

import '../../navigation_bar/bloc/navigation_bloc.dart';
import '../../navigation_bar/bloc/navigation_event.dart';
import '../repository/compositions_repository.dart';
import '../widgets/liked_songs_top_bar_widget.dart';

class LikedSongsScreen extends StatelessWidget {
  const LikedSongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NavigationBloc>(context)
        .add(NavigationInactiveTabEvent(tabNumber: 2));
    return Scaffold(
      appBar: const TopBar(),
      bottomNavigationBar: const MyNavigationBar(),
      body: ListView(
        children: [
          const ListViewTop(),
          BlocProvider(
            create: (context) =>
                CompositionsBloc(repository: CompositionsRepository())
                  ..add(GetCompositionsEvent()),
            child: BlocBuilder<CompositionsBloc, CompositionsState>(
              builder: (context, state) {
                if (state is CompositionsLoaded) {
                  return Column(
                    children: List.generate(
                      state.compositions.length,
                      (index) => ListTile(
                        onTap: () {},
                        title: Text(
                          state.compositions[index].title ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          state.compositions[index].artist ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        leading: Builder(
                          builder: (context) {
                            if (state.compositions[index].image != null) {
                              return Image.network(
                                  state.compositions[index].image!);
                            }
                            return const Icon(Icons.image);
                          },
                        ),
                        trailing: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                if (state is CompositionsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong. Try open page again.',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
