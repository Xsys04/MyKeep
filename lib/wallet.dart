import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wallet {
  String address = '0x';

  getView() {
    return ListView(
        children: <Widget> [Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: new TextFormField(
            decoration: new InputDecoration(
              labelText: "Enter ETH Wallet",
              fillColor: Colors.green,
              hintText: address,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(7),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {
              if (val == 0) {
                return "Email cannot be empty";
              } else {
                return null;
              }
            },
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
        getCard('assets/keep.png', 0),
        getCard('assets/tbtc.png', 1),
        getCard('assets/eth.png', 2)
      ],
    )]);
  }

  Future<void> saveWallet(String address) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    // set value
    prefs.setString('wallet', address);
  }

  getWallet() async {
    final prefs = await SharedPreferences.getInstance();
    address = await prefs.getString('wallet') ?? "0x";
  }

  List<Crypto> getData() {
    List<Crypto> list = [];
    list.add(new Crypto('Keep', '15693', '0.32', '5021'));
    list.add(new Crypto('tBtc', '0.35', '12900', '4515'));
    list.add(new Crypto('Eth', '1.21', '380', '459'));
    return list;
  }

  getCard(String logoPath, int currency) {
    var data = getData();

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 160,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  width: 150,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.asset(logoPath
                                        // fit: BoxFit.cover,
                                        ),
                                  ))),
                          Container(
                            child: Text(
                              data[currency].price + "\$",
                              style: TextStyle(
                                  fontFamily: 'ApercuProMono', fontSize: 28),
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              data[currency].amount + " " + data[currency].name,
                              style: TextStyle(
                                  fontFamily: 'ApercuProMono', fontSize: 23),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10,0, 0, 0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              data[currency].amountUsd + " \$",
                              style: TextStyle(
                                  fontFamily: 'ApercuProMono', fontSize: 16),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Crypto {
  String name = '';
  String amount = '';
  String price = '';
  String amountUsd = '';

  Crypto(this.name, this.amount, this.price, this.amountUsd);
}
