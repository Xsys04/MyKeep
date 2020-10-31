import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tbtcCharts.dart';
import 'DataProvider.dart';

class Tbtc {
  Map<String, dynamic> dataMap = new HashMap<String, String>();
  Charts charts =  new Charts();

  getView() {

    return Container(
        child: Column(children: [
          new Expanded(child:
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 130,
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 2, 5, 2),
                    child: charts.getChart(dataMap),)))),
      Row(mainAxisSize: MainAxisSize.max,
          children: [
            new Expanded(child:
        Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
            height: 130,
            child: Card(
                semanticContainer: true,
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        'Supply',
                        style: TextStyle(
                            fontFamily: 'ApercuProMono', fontSize: 25),
                      ),
                      Text(dataMap['supply']!=null?dataMap['supply']:'0',
                        style: TextStyle(
                            fontFamily: 'ApercuProMono', fontSize: 42, color: Colors.black),
                      ),
                    ],
                  ),
                ))), flex: 1),
            new Expanded(child:
        Container(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
            height: 130,
            child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        'Holders',
                        style: TextStyle(
                            fontFamily: 'ApercuProMono', fontSize: 25),
                      ),
                      Text(dataMap['holders']!=null?dataMap['holders']:'0',
                        style: TextStyle(
                            fontFamily: 'ApercuProMono', fontSize: 42, color: Colors.black),
                      ),
                    ],
                  ),
                ))), flex: 1,),
      ]),
          Row(mainAxisSize: MainAxisSize.max,
              children: [
                new Expanded(child:
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                    height: 130,
                    child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                'Minted',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 25),
                              ),
                              Text(dataMap['minted']!=null?dataMap['minted']:'0',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 42, color: Colors.black),
                              ),
                            ],
                          ),
                        ))), flex: 1),
                new Expanded(child:
                Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
                    height: 130,
                    child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                'Burned',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 25),
                              ),
                              Text(dataMap['burned']!=null?dataMap['burned']:'0',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 42, color: Colors.black),
                              ),
                            ],
                          ),
                        ))), flex: 1,),
              ]),
          Row(mainAxisSize: MainAxisSize.max,
              children: [
                new Expanded(child:
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                    height: 130,
                    child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                'Deposit',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 25),
                              ),
                              Text(dataMap['deposit']!=null?dataMap['deposit']:'0',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 42, color: Colors.black),
                              ),
                            ],
                          ),
                        ))), flex: 1),
                new Expanded(child:
                Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
                    height: 130,
                    child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                '\$ Value',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 25),
                              ),
                              Text(dataMap['value']!=null?dataMap['value']:'0',
                                style: TextStyle(
                                    fontFamily: 'ApercuProMono', fontSize: 42, color: Colors.black),
                              ),
                            ],
                          ),
                        ))), flex: 1,),
              ]),
    ])
    );
  }

getData() async {
    var new_data = await DataProvider.getTbtcData();
    if (dataMap != '0'){
      dataMap = new_data;
    }
    return dataMap;
  }
}
