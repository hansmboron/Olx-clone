import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  final String currentSearch;

  SearchDialog({this.currentSearch});

  @override
  _SearchDialogState createState() => _SearchDialogState(currentSearch);
}

class _SearchDialogState extends State<SearchDialog> {
  final TextEditingController _controller;

  _SearchDialogState(String currentSearch)
      : _controller = TextEditingController(text: currentSearch);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 1),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey[700],
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                suffix: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey[700],
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
