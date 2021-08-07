import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class Flights extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Flights Favourites",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.flight,
                color: Color.fromARGB(255, 37, 74, 118),
              ), // icon is 48px widget.
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Favourite flight booking websites to book domestic and international flights",
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 37, 74, 118)),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            buildResponsiveCardHyperlink(
                "Webjet",
                "Webjet an online travel agency in Australia and New Zealand",
                "https://www.webjet.com.au/",
                "assets/webjet.png",
                BoxFit.fitWidth
            ),
            buildResponsiveCardHyperlink(
                "Flight Centre",
                "Flight Centre Australia is Australia's largest retailer of travel",
                "https://www.flightcentre.com.au/",
                "assets/flightcentre.png",
                BoxFit.fitWidth
            ),
            buildResponsiveCardHyperlink(
                "Qantas",
                "Qantas Airways is the largest airline in Australia with international and domestic flights",
                "https://www.qantas.com/",
                "assets/qantas.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Jetstar",
                "Jetstar Airways Pty Ltd, operating as Jetstar, is an Australian low-cost airline headquartered in Melbourne",
                "https://www.jetstar.com/",
                "assets/jetstar.png",
                BoxFit.fitHeight
            ),
          ],
        ),
      ]),
    );
  }

  ResponsiveGridCol buildResponsiveCardHyperlink(String title, String body, String link, String img, BoxFit boxfit) {
    return ResponsiveGridCol(
          xs: 20,
          md: 3,
          child: Container(
            height: 200,
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  FirebaseAnalytics().logEvent(name: title,parameters:null);
                  urlHandler.launchURL(link);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 10, top: 20),
                  title: Text(title),
                  subtitle: Text(body),
                  trailing: Image.asset(
                      img, fit: boxfit,
                    width: 100, height: 100,
                  ),
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
