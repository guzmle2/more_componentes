import 'dart:async';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static final pathName = 'listview';

  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumber = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists '),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: obtainPage,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumber.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _listNumber[index];
            return FadeInImage(
              image:
                  NetworkImage('https://picsum.photos/500/300/?images=$image'),
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250.0,
            );
          }),
    );
  }

  Future obtainPage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumber.clear();
      _ultimoItem++;
      _addImages();
    });
    return Future.delayed(duration);
  }

  _addImages() {
    final numberIteration = Iterable<int>.generate(5).toList();
    for (var num in numberIteration) {
      _ultimoItem++;
      _listNumber.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    new Timer(new Duration(seconds: 2), resposeHttp);
  }

  void resposeHttp() {
    _isLoading = false;
    _addImages();
    _scrollController.animateTo(_scrollController.position.pixels + 40,
        duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);

    setState(() {});
  }

  _createLoading() {
    final loading = Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
        SizedBox(
          height: 15.0,
        )
      ],
    );

    return _isLoading ? loading : Container();
  }
}
