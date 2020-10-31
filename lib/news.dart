import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News {
  int type;
  String name;
  String text;
  String link;
  News(this.type, this.name, this.text, this.link);
}
class NewsFactory {
  List<News> listNews = [];
  getCardWidget(News news){
    Color platformColor = Color(0xFFffffff);

    switch(news.type){
      case 0:
        platformColor = Color(0xFF1da1f2);

        break;
      case 1:
        platformColor = Color(0xFF23272a);

        break;
      case 2:
        platformColor = Color(0xFFffffff);
        break;

    }


    return Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 220,
      width: double.maxFinite,
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.white, platformColor])),
        child:
          Card(
            elevation: 5,
           child: Column(children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                ),
                child: Container(
                child:
                  Padding(
                  padding: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Text(
                    news.name,
                    style: TextStyle(fontSize: 25.0, fontFamily: 'ApercuProMono',),
                  ),))
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,10,10,10),
                child:
                Text(news.text,
                  style: TextStyle(fontFamily: 'ApercuProMono',fontSize: 15.0,),
                )),
              ),
             ConstrainedBox(
               constraints: BoxConstraints(
               ),
               child: Padding(
                   padding: EdgeInsets.fromLTRB(10,10,10,10),
                   child:
                   InkWell(
                     child: Container(alignment: Alignment.topLeft, child:Text("Read in source", style: TextStyle(color: Colors.blue),),),
                     onTap: () async {
                       if (await canLaunch(news.link)) {
                         await launch(news.link);
                       }
                     },
                   ),),
             ),
        ])
      ),
    )
    );
  }
  void uploadNews(){
    listNews.clear();
      listNews.add(new News(0, "Keep #tBTC", "We are proud to announce that the #tBTC contracts are now fully deployed on the #Ethereum mainnet", "https://twitter.com/keep_project/status/1308418829794578433"

      ));
      listNews.add(new News(1, "Matt Luongo", "Had a fun whiteboarding session with the NEAR team on the design of tBTC :)", "https://discord.com/channels/590951101600235531/723193368812978186/771807649771028480"

      ));
      listNews.add(new News(2, "Introducing tBTC", "Decentralized finance (DeFi) is one of the most exciting sectors to watch in 2020. Over the past year the amount of ETH ...", "https://blog.keep.network/introducing-tbtc-the-safest-way-to-earn-with-your-bitcoin-fec077f171f4"

      ));


  }
  getNews(int type) {
    type = type;

    List<Widget> resultList = [];
    for (var news in listNews) {
      if (type == -1) {
        resultList.add(getCardWidget(news));
      }
      else {
        if (type == news.type){
          resultList.add(getCardWidget(news));
        }
      }

    }
    return resultList;

    }
}
