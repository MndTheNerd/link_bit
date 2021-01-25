import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.consWidth,
  }) : super(key: key);

  final double consWidth;

  @override
  Widget build(BuildContext context) {
    final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _titleController = TextEditingController();
    TextEditingController _urlController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return SizedBox(
      width: consWidth,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Add a Link',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        color: Colors.blue[400],
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add new link'),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (value) {
                            return value.isEmpty
                                ? 'Please add the Title'
                                : null;
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
                        onPressed: () {
                          print(_titleController.text);
                          print(_urlController.text);
                          if (_formKey.currentState.validate()) {
                            _linksCollection.add(
                              LinkData(
                                title: _titleController.text,
                                url: _urlController.text,
                              ).toMap(),
                            );
                            Navigator.of(context).pop();
                            _formKey.currentState.reset();
                          }
                        },
                        child: Text('Add')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel')),
                  ],
                );
              });
        },
      ),
    );
  }
}
