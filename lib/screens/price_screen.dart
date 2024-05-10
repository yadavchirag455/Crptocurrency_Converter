import 'dart:convert';
import 'package:bitcoin_convertor/utils/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedValue = currenciesList[0];

  List<DropdownMenuItem<String>> getDropDownItem() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      // print(currenciesList[i]);

      String currency = currenciesList[i];

      var newItem = DropdownMenuItem(child: Text(currency), value: currency);

      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  dynamic resultsOfApi;

  void fetchAPIData() async {
    var res = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apiKey=5BEBFEE3-071F-4601-ADBE-DB1DD2E57D84'));

    resultsOfApi = jsonDecode(res.body);

    setState(() {});
    print(resultsOfApi['rate'].toString);
  }

  @override
  void initState() {
    fetchAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getDropDownItem();
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${resultsOfApi['rate'].toStringAsFixed(2)} USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${resultsOfApi['rate'].toStringAsFixed(2)} USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${resultsOfApi['rate'].toStringAsFixed(2)} USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedValue,
              items: getDropDownItem(),
              onChanged: (value) {
                selectedValue = value;
                setState(() {});

                print(selectedValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
