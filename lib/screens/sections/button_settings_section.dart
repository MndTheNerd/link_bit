import 'dart:html';

import 'package:flutter/material.dart';
import 'package:link_bit/constants.dart';

class ButtonSettingsSection extends StatelessWidget {
  const ButtonSettingsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Add a Link',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    color: Colors.blue[400],
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) {},
                    children: [
                      for (var document in documents)
                        ListTile(
                          title: Text(document.title),
                          key: Key(document.title),
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
