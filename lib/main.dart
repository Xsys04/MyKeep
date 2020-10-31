import 'dart:ui';
import 'package:startup_namer/tbtc.dart';
import 'keep.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/wallet.dart';
import 'news.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Keep'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF20C997),
      unselectedItemColor: Color(0xFF23272a),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedLabelStyle: TextStyle(fontFamily: 'ApercuProMono'),
      unselectedLabelStyle: TextStyle(fontFamily: 'ApercuProMono'),
      items: [
        BottomNavigationBarItem(
          label: 'Keep',
          icon: Icon(Icons.analytics),
        ),
        BottomNavigationBarItem(
          label: 'tBTC',
          icon: Icon(Icons.assessment_outlined),
        ),
        BottomNavigationBarItem(
          label: 'News',
          icon: Icon(Icons.library_books),
        ),
        BottomNavigationBarItem(
          label: 'Wallet',
          icon: Icon(Icons.account_balance_wallet),
        ),
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Keep");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("tBTC");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("News");
        break;
      case 3:
        _navigatorKey.currentState.pushReplacementNamed("Wallet");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    Keep keep = new Keep();
    Tbtc tbtc = new Tbtc();
    var wallet = Wallet();
    wallet.getWallet();
    switch (settings.name) {
      case "Keep":
        return MaterialPageRoute(
          builder: (context) => Scaffold(
              body: FutureBuilder<dynamic>(
            future: keep.getData(),
            // if you mean this method well return image url
            // ignore: missing_return
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return keep.getView();
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("");
              // You can reach your snapshot.data['url'] in here
              }
            },
          )) ,
        );

      case "tBTC":
        return MaterialPageRoute(
          builder: (context) => Scaffold(
              body: FutureBuilder<dynamic>(
            future: tbtc.getData(),
            // if you mean this method well return image url
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return tbtc.getView();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("");
              }
            },
          )),
        );
      case "Wallet":
        return MaterialPageRoute(
            builder: (context) => Container(child: wallet.getView()));

      case "News":
        NewsFactory news = new NewsFactory();
        news.uploadNews();
        return MaterialPageRoute(
            builder: (context) => Container(
                    child: ListView(children: [
                  Wrap(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ChoiceChip(
                        label: Text("Twitter"),
                        selected: indexSelected == 0,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 0 : -1;
                            news.getNews(indexSelected);
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ChoiceChip(
                        // selectedColor: Color(0xFF20C997),
                        label: Text("Discord"),
                        selected: indexSelected == 1,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 1 : -1;
                            news.getNews(indexSelected);
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ChoiceChip(
                        label: Text("Blog"),
                        selected: indexSelected == 2,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 2 : -1;
                            news.getNews(indexSelected);
                          });
                        },
                      ),
                    )
                  ]),
                  Column(children: news.getNews(indexSelected))
                ])));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Image.asset("assets/intro.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          )
        );
    }
  }
}
