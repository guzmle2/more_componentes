import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  static final pathName = 'inputs';

  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() {
    return _InputsPageState();
  }
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _powers = [
    'Vision laser',
    'Volar',
    'Velocidad',
    'Fuerza',
    'Rayos X'
  ];
  String _powerSelected = 'Volar';

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
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          _generateInputField(),
          Divider(),
          _generateEmail(),
          Divider(),
          _generatePassword(),
          Divider(),
          _generateDate(context),
          Divider(),
          _generateDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  _generateInputField() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_name.length}'),
          hintText: 'Name to person',
          labelText: 'Name',
          helperText: "it's just the name",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) => setState(() {
        _name = valor;
      }),
    );
  }

  _generateEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'email to person',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  _generatePassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        _password = valor;
      }),
    );
  }

  _generateDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Date of birth ',
          labelText: 'Date of birth',
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
        context: context,
        locale: Locale('es', 'ES'),
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2025));
    if (picker != null) {
      setState(() {
        _date = picker.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> retorno = new List();
    _powers.forEach((power) {
      retorno.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });
    return retorno;
  }

  Widget _generateDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            value: _powerSelected,
            items: getOptions(),
            onChanged: (opt) => setState(() {
              _powerSelected = opt;
            }),
          ),
        ),
      ],
    );
  }

  Widget _createPerson() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Name insert: $_name'),
          subtitle: Text('Email insert: $_email'),
          trailing: Text('Power $_powerSelected'),
        ),
      ],
    );
  }
}
