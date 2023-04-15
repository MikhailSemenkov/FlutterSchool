import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../liked_songs/screens/liked_songs_screen.dart';
import '../../navigator/navigator_keys.dart';
import '../bloc/library_bloc.dart';
import '../repository/library_repository.dart';
import '../widgets/library_content_choose_bar_widget.dart';
import '../widgets/library_list_view_item_widget.dart';
import '../widgets/library_order_bar_widget.dart';
import '../widgets/library_top_bar_widget.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: NavigatorKeys.navigatorKeyLibraryPage,
      initialRoute: '/',
      onGenerateRoute: (route) => MaterialPageRoute(
        builder: (context) => ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const TopBar(),
                  const ContentChooseBar(),
                  const OrderBar(),
                  BlocProvider(
                    create: (context) =>
                        LibraryBloc(repository: LibraryRepository())
                          ..add(GetPlaylistsEvent()),
                    child: BlocBuilder<LibraryBloc, LibraryState>(
                        builder: (context, state) {
                      if (state is LibraryLoadedState) {
                        return Column(children: [
                          ListTile(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LikedSongsScreen(),
                              ),
                            ),
                            title: Text(
                              'Liked Songs',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              'playlist - 10 songs',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            leading: const Icon(
                              Icons.image,
                              size: 56,
                            ),
                          ),
                          ...List.generate(
                            state.playlists.length,
                            (i) => ListViewItem(
                              title: state.playlists[i].title,
                              description: state.playlists[i].description,
                              onTap: () {},
                              image: state.playlists[i].image,
                            ),
                          ),
                        ]);
                      }
                      if (state is LibraryLoadingState) {
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
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
