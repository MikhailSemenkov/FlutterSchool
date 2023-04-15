import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/compositions_bloc.dart';
import '../repository/compositions_repository.dart';
import '../widgets/liked_songs_list_view_top_widget.dart';
import '../widgets/liked_songs_top_bar_widget.dart';

class LikedSongsScreen extends StatelessWidget {
  const LikedSongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: ListView(
        children: [
          const ListViewTop(),
          BlocProvider(
            create: (context) =>
                CompositionsBloc(repository: CompositionsRepository())
                  ..add(GetCompositionsEvent()),
            child: BlocBuilder<CompositionsBloc, CompositionsState>(
              builder: (context, state) {
                if (state is CompositionsLoadedState) {
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
                                state.compositions[index].image!,
                              );
                            }
                            return const Icon(
                              Icons.image,
                              size: 56,
                            );
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
                if (state is CompositionsLoadingState) {
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
