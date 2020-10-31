import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataProvider.dart';
import 'keepCharts.dart';

class Keep {
  Map<String, dynamic> dataMap = new HashMap<String, String>();
  Charts charts = new Charts();
  getView() {
    String df = 'sdfsdf';
    String dff = 'sdfsdf';
    return Container(
        child: Column(children: [
      Row(mainAxisSize: MainAxisSize.max, children: [
        new Expanded(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 10, 3, 0),
                height: 130,
                child: Card(
                    semanticContainer: true,
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
                          Text(
                            dataMap['holders'],
                            style: TextStyle(
                                fontFamily: 'ApercuProMono',
                                fontSize: 42,
                                color: Color(0xFF20C997)),
                          ),
                        ],
                      ),
                    ))),
            flex: 1),
        new Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(3, 10, 10, 0),
              height: 130,
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontFamily: 'ApercuProMono', fontSize: 25),
                        ),
                        Text(
                          dataMap['price'],
                          style: TextStyle(
                              fontFamily: 'ApercuProMono',
                              fontSize: 42,
                              color: Color(0xFF20C997)),
                        ),
                      ],
                    ),
                  ))),
          flex: 1,
        ),
      ]),
      Row(mainAxisSize: MainAxisSize.max, children: [
        new Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 3, 0),
                height: 130,
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            'Stakers',
                            style: TextStyle(
                                fontFamily: 'ApercuProMono', fontSize: 25),
                          ),
                          Text(
                            dataMap['stakers'],
                            style: TextStyle(
                                fontFamily: 'ApercuProMono',
                                fontSize: 42,
                                color: Color(0xFF20C997)),
                          ),
                        ],
                      ),
                    ))),
            flex: 1),
        new Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(3, 5, 10, 0),
              height: 130,
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          'Staked',
                          style: TextStyle(
                              fontFamily: 'ApercuProMono', fontSize: 25),
                        ),
                        Text(
                          dataMap['staked'],
                          style: TextStyle(
                              fontFamily: 'ApercuProMono',
                              fontSize: 42,
                              color: Color(0xFF20C997)),
                        ),
                      ],
                    ),
                  ))),
          flex: 1,
        ),
      ]),
      Row(mainAxisSize: MainAxisSize.max, children: [
        new Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 3, 0),
                height: 130,
                child: Card(
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
                          Text(
                            dataMap['supply'],
                            style: TextStyle(
                                fontFamily: 'ApercuProMono',
                                fontSize: 42,
                                color: Color(0xFF20C997)),
                          ),
                        ],
                      ),
                    ))),
            flex: 1),
        new Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(3, 5, 10, 0),
              height: 130,
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          'Cap',
                          style: TextStyle(
                              fontFamily: 'ApercuProMono', fontSize: 25),
                        ),
                        Text(
                          dataMap['cap'],
                          style: TextStyle(
                              fontFamily: 'ApercuProMono',
                              fontSize: 42,
                              color: Color(0xFF20C997)),
                        ),
                      ],
                    ),
                  ))),
          flex: 1,
        ),
      ]),
      new Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 130,
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 2, 5, 2),
                    child:
                    charts.getChart(dataMap),
                  ))))
    ]));
  }

getData() async {
    var new_data = await DataProvider.getKeepData();
    if (dataMap != '0'){
      dataMap = new_data;
    }
    return dataMap;
  }

}
