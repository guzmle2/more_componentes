import 'package:flutter/material.dart';
import 'package:morecomponentes/src/providers/menu_provider.dart';
import 'package:morecomponentes/src/utils/incon_string_util.dart';

class HomePage extends StatelessWidget {
  static final pathName = 'home';

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lisOptions(),
    );
  }

  Widget _lisOptions() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(data, BuildContext context) {
    final List<Widget> retorno = [];
    if (data == null) {
      return retorno;
    }
    data.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, option['ruta']);
        },
      );
      retorno..add(widgetTemp)..add(Divider());
    });
    return retorno;
  }
}
