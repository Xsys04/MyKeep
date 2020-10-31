class KChartSeries {
  Map<DateTime, double> createLineData(double factor) {
    Map<DateTime, double> data = {};

    for (int c = 50; c > 0; c--) {
      data[DateTime.now().subtract(Duration(minutes: c))] =
          c.toDouble() * factor;
    }

    return data;
  }

  Map<DateTime, double> createLineAlmostSaveValues() {
    Map<DateTime, double> data = {};
    data[DateTime.now().subtract(Duration(minutes: 40))] = 25.0;
    data[DateTime.now().subtract(Duration(minutes: 30))] = 25.0;
    data[DateTime.now().subtract(Duration(minutes: 22))] = 25.0;
    data[DateTime.now().subtract(Duration(minutes: 20))] = 24.9;
    data[DateTime.now().subtract(Duration(minutes: 15))] = 25.0;
    data[DateTime.now().subtract(Duration(minutes: 12))] = 25.0;
    data[DateTime.now().subtract(Duration(minutes: 5))] = 25.0;

    return data;
  }

  Map<DateTime, double> createLine1(Map<String, dynamic> datas) {

    Map<DateTime, double> data = {};
    for (var item in datas['price_list']) {


      data[DateTime.fromMicrosecondsSinceEpoch(item['time'])] = double.parse(item['price']);
    }

    return data;
  }
}
