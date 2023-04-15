import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required String? title,
    required String? description,
    required Function onTap,
    required String? image,
  })  : _description = description,
        _title = title,
        _onTap = onTap,
        _image = image;

  final String? _title;
  final String? _description;
  final Function _onTap;
  final String? _image;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListTile(
        onTap: _onTap(),
        title: Text(
          _title ?? 'Unknown',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          _description ?? 'Unknown',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: Builder(
          builder: (context) {
            if (_image != null) {
              return Image.network(
                _image!,
              );
            }
            return const Icon(
              Icons.image,
              size: 56,
            );
          },
        ),
      );
    });
  }
}
