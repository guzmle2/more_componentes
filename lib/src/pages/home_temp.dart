import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  static final options = Iterable<int>.generate(4).toList();

  HomePageTemp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(children: _listItemsShort()),
    );
  }

  List<Widget> _listItems() {
    List<Widget> retorno = new List<Widget>();
    for (var opt in options) {
      final tempWidget = ListTile(
        title: Text('Item $opt'),
      );
      retorno..add(tempWidget)..add(Divider());
    }
    return retorno;
  }

  List<Widget> _listItemsShort() {
    var widgets = options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('Item $item'),
            subtitle: Text('sup'),
            leading: Icon(Icons.assistant),
            trailing: Icon(Icons.account_circle),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
    return widgets;
  }
}
