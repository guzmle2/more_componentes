import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  static final pathName = 'sliders';
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() {
    return _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  double _valueDouble = 100.0;
  bool _blockResizeImage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Size image',
      value: _valueDouble,
      min: 10,
      max: 400,
      onChanged: _blockResizeImage
          ? null
          : (double value) => setState(() {
                _valueDouble = value;
              }),
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://seeklogo.com/images/B/batman-logo-A2C7E7D106-seeklogo.com.png'),
      width: _valueDouble,
      fit: BoxFit.contain,
    );
  }

  _createCheckbox() {
    final checbokInput = Checkbox(
      value: _blockResizeImage,
      onChanged: (bool value) => setState(() {
        _blockResizeImage = value;
      }),
    );

    return CheckboxListTile(
      title: Text('Block slider'),
      value: _blockResizeImage,
      onChanged: (bool value) => setState(() {
        _blockResizeImage = value;
      }),
    );
  }

  _createSwitch() {
    return SwitchListTile(
      title: Text('Block slider'),
      value: _blockResizeImage,
      onChanged: (bool value) => setState(() {
        _blockResizeImage = value;
      }),
    );
  }
}
