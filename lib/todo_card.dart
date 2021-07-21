import 'package:flutter/material.dart';
import 'package:g_mon/card_content.dart';

class ToDoCard extends StatefulWidget {
  CardContent cardContents;
  ToDoCard({@required this.cardContents});

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    var title = widget.cardContents.title;
    var contents = widget.cardContents.contents;
    var color = widget.cardContents.color;
    bool toggle = false;
    // List<bool> toggles = List.generate(contents.length, (i) => false);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: color,
      child: ReorderableListView(
        header: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        children: <Widget>[
          for (var item in contents)
            CheckboxListTile(
              key: Key(item),
              title: StrikeThrough(todoText: item, todoToggle: toggle),
              controlAffinity: ListTileControlAffinity.leading,
              value: toggle,
              onChanged: (bool) {
                setState(() {
                  if (!bool) {
                    toggle = false;
                  } else {
                    toggle = true;
                  }
                });
              },
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            var getReplacedWidget = contents.removeAt(oldIndex);
            contents.insert(newIndex, getReplacedWidget);
          });
        },
      ),
    );
  }
}

class StrikeThrough extends StatelessWidget {
  bool todoToggle;
  String todoText;
  StrikeThrough({Key key, this.todoToggle, this.todoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todoToggle == false) {
      return Text(
        todoText,
        style: TextStyle(fontSize: 22.0),
      );
    } else {
      return Text(
        todoText,
        style: TextStyle(
            fontSize: 22.0,
            decoration: TextDecoration.lineThrough,
            color: Colors.redAccent,
            fontStyle: FontStyle.italic),
      );
    }
  }
}
