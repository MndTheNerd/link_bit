import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.consWidth,
  }) : super(key: key);

  final double consWidth;

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _urlController = TextEditingController();
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'Instagram',
                          ),
                        ),
                        TextFormField(
                          controller: _urlController,
                          decoration: InputDecoration(
                            labelText: 'URL',
                            hintText: 'www.intagram.com/user',
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
                          Navigator.of(context).pop();
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
