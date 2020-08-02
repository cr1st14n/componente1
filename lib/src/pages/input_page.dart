import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = [
    'Volar',
    'Rayos X',
    'Super Aliento',
    ' Super Fuerza'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInputs() {
    return TextField(
      // autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'nombre de la persona',
        labelText: 'nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Nombre es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      // autofocus: false,
      // textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Email',
        labelText: 'Email',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() => _email = value);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      // autofocus: false,
      // textCapitalization: TextCapitalization.sentences,
      // keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Password',
        labelText: 'Password',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        setState(() => _email = value);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      // autofocus: false,
      // textCapitalization: TextCapitalization.sentences,
      // keyboardType: TextInputType.emailAddress,
      // obscureText: true,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // counter: Text('Letras ${ _nombre.length }'),
        hintText: 'fecha de nacimiento',
        labelText: 'fecha de nacimiento',
        // helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2021),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> list = List();
    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return list;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              print(opt);
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }
}
