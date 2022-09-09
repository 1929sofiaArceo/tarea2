import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum SingingCharacter { amazing, good, okay }

class _HomePageState extends State<HomePage> {

  var _txtCostService = TextEditingController();
  SingingCharacter? _character = SingingCharacter.amazing;
  bool isSwitched = false;
  double _cost = 0.0;
  double _tip = 0.0;
  num _tipCalc = 0.0;
  String _result = "0.00";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service, color: Colors.green),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: _txtCostService,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Cost of service",
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining, color: Colors.green,),
            title: Text("How was the service?"),
          ),
          ListTile(
            title: const Text('Amazing 20%'),
            leading: Radio<SingingCharacter>(
              activeColor: Colors.green,
              value: SingingCharacter.amazing,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Good 18%'),
            leading: Radio<SingingCharacter>(
              activeColor: Colors.green,
              value: SingingCharacter.good,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Okay 15%'),
            leading: Radio<SingingCharacter>(
              activeColor: Colors.green,
              value: SingingCharacter.okay,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          SwitchListTile(
            title: Text("Round up tip"),
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            secondary: Icon(Icons.credit_card, color: Colors.green)
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              child: Text("CALCULATE"),
              onPressed: () {
                _tipCalculation();
                setState(() {});
              },
              color: Colors.green,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(alignment: Alignment.bottomRight ,child: Text("Tip amount: \$"+"${_result}")),
          )
        ],
      ),
    );
  }

  void _tipCalculation() {
    print("PASS");
    // TODO: completar
    // double tip = double.parse(_character.text);
    _cost = double.parse(_txtCostService.text);
    if(_character.toString() == 'SingingCharacter.okay'){
      _tip = 15;
    }
    else if(_character.toString() == 'SingingCharacter.good'){
      _tip = 18;
    }else{
      _tip = 20;
    }
    _tipCalc = (_tip/100) * _cost;
    if(isSwitched) _tipCalc = _tipCalc.ceil();
    _result = _tipCalc.toStringAsFixed(2);
    setState(() {});
  }
}