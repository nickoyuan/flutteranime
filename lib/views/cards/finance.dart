import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class Finance extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Online Financial websites",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.monetization_on,
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
                  "Websites for stocks and investments",
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
                "Simply Wall St",
                "Unique, exhaustive analysis on every listed stock worldwide at your fingertips.",
                "https://simplywall.st/about",
                "assets/simplywallst.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "The Motley Fool",
                ", The Motley Fool helps millions of people attain financial freedom through our website, podcasts, books",
                "https://www.fool.com.au/",
                "assets/tmf.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "HotCopper",
                "HotCopper is Australia's largest free and independent stock market trading forum for ASX",
                "https://hotcopper.com.au/",
                "assets/hotcopper.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Financial Times",
                "News, analysis and comment from the Financial Times, the world's leading global business publication.",
                "https://www.ft.com/",
                "assets/ft.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Financial Review",
                "The Australian Financial Review reports the latest news from business, finance, investment and politics, updated in real time.",
                "https://www.afr.com/",
                "assets/financial_review.png",
                BoxFit.fitHeight
            )
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
