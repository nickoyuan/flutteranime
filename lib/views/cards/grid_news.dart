import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class GridNews extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        ResponsiveGridRow(
          children: [
            buildResponsiveCardHyperlink(
                "News",
                "https://www.webjet.com.au/",
                "assets/plane.png",
                BoxFit.contain),
            buildResponsiveCardHyperlink(
                "Videos",
                "https://www.flightcentre.com.au/",
                "assets/flightcentre.png",
                BoxFit.fitWidth),
            buildResponsiveCardHyperlink(
                "Games",
                "https://www.qantas.com/",
                "assets/qantas.png",
                BoxFit.fitHeight),
            buildResponsiveCardHyperlink(
                "Tour",
                "https://www.jetstar.com/",
                "assets/jetstar.png",
                BoxFit.fitHeight),
          ],
        ),
      ]),
    );
  }

  ResponsiveGridCol buildResponsiveCardHyperlink(
      String title, String link, String img, BoxFit boxfit) {
    return ResponsiveGridCol(
      xs: 5,
      md: 3,
      child: Container(
        height: 250,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              FirebaseAnalytics().logEvent(name: title,parameters:null);
              urlHandler.launchURL(link);
            },
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 10, top: 20),
                  title: Text(title),
                ),
                Expanded(
                    child: new Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/plane.png'),
                            fit: BoxFit.cover,
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UrlHandler {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
