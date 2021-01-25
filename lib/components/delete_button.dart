

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key key,
    @required this.document,
  }) : super(key: key);

  final LinkData document;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            final _linksCollection =
                Provider.of<CollectionReference>(
                    context);
            return AlertDialog(
              title: Text(
                'Are you sure you want to delete ${document.title} button?',
              ),
              content: Text(
                  '${document.title} will be deleted'),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                FlatButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    _linksCollection
                        .doc(document.id)
                        .delete();
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
