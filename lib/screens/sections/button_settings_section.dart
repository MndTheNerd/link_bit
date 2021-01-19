import 'package:flutter/material.dart';
import 'package:link_bit/components/add_button.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:provider/provider.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);
    //using a progress indicator while the data loads

    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final consWidth = constraints.maxWidth * 0.6;
          if (_documents == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            color: Colors.blueGrey.shade50,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Your Links',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 80),
                AddButton(consWidth: consWidth),
                SizedBox(height: 30),
                SizedBox(
                  width: consWidth,
                  height: constraints.maxHeight * 0.5,
                  child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) {},
                    children: [
                      for (var document in _documents)
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          title: Text(document.title),
                          key: Key(document.title),
                          leading: Icon(Icons.drag_indicator),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Are you sure you want to delete ${document.title} button?',
                                        ),
                                        content: Text(
                                            '${document.title} will be deleted'),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
