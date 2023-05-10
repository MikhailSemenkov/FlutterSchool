import 'package:final_project/api_client/api_client.dart';
import 'package:final_project/detail_page/widgets/comments_list_tile_widget.dart';
import 'package:final_project/error_screen/screens/error_screen.dart';
import 'package:final_project/loading_screen/screens/loading_screen.dart';
import 'package:flutter/material.dart';

import '../../data/comments.dart';
import 'write_comment_widget.dart';

class CommentsListWidget extends StatefulWidget {
  const CommentsListWidget({Key? key, required int movieId})
      : _movieId = movieId,
        super(key: key);

  final int _movieId;

  @override
  State<CommentsListWidget> createState() => _CommentsListWidgetState();
}

class _CommentsListWidgetState extends State<CommentsListWidget> {
  late Future<Comments> _future;

  @override
  void initState() {
    _future = APIClient().listOfComments(widget._movieId);
    super.initState();
  }

  _reloadWidgetData() {
    setState(() {
      _future = APIClient().listOfComments(widget._movieId);
    });
  }

  _addComment() {
    showDialog(
      context: context,
      builder: (context) => WriteCommentWidget(
        movieId: widget._movieId,
        onAdd: _reloadWidgetData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: _addComment,
        child: const Icon(
          Icons.edit,
          size: 22,
        ),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data!.data!;
            if (data.isNotEmpty) {
              return Column(
                children: [
                  Flexible(
                    child: ListView(
                      children: List.generate(
                        data.length,
                        (index) => CommentsListTileWidget(
                          comment: data[index],
                          reloadWidgetData: _reloadWidgetData,
                          context: context,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('There is no comments yet'),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return ErrorScreen(
              onPressed: _reloadWidgetData,
              message: 'Can not load comments list',
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
