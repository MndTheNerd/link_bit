import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:provider/provider.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key key,
    @required this.document,
  }) : super(key: key);

  final LinkData document;

  @override
  Widget build(BuildContext context) {
    final _linksCollection = Provider.of<CollectionReference>(context);

    final _formKey = GlobalKey<FormState>();
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              TextEditingController _titleController = TextEditingController(
                text: document.title,
              );
              TextEditingController _urlController = TextEditingController(
                text: document.url,
              );
              return AlertDialog(
                title: Text('Edit ${document.title} Button'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Please add the Title' : null;
                        },
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Instagram',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty ? 'Please add the URL' : null;
                        },
                        controller: _urlController,
                        decoration: InputDecoration(
                          labelText: 'URL',
                          hintText: 'https://www.intagram.com/user',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        final userChangedTitle =
                            document.title != _titleController.text;
                        final userChangedURL =
                            document.url != _urlController.text;
                        final userUpdateForm =
                            userChangedURL || userChangedTitle;

                        print(_titleController.text);
                        print(_urlController.text);
                        if (_formKey.currentState.validate()) {
                          if (userUpdateForm) {
                            final newLinkData = LinkData(
                              title: _titleController.text,
                              url: _urlController.text,
                            );
                            _linksCollection.doc(document.id).update(
                                  newLinkData.toMap(),
                                );

                            _formKey.currentState.reset();
                            print('updated');
                          }
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Save')),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel')),
                ],
              );
            });
      },
    );
  }
}
