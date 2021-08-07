import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class Covid extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Covid statistics",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.coronavirus,
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
                  "Websites for Covid statistics",
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
                "World Meter info",
                "Coronavirus counter with new cases, deaths, and number of tests per 1 Million population",
                "https://www.worldometers.info/coronavirus/country/australia/",
                "assets/worldmeter.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "World Health Organization",
                "Read more about COVID-19 on the Official COVID-19 page from the World Health Organization.",
                "https://covid19.who.int/region/wpro/country/au",
                "assets/who.jpeg",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Our World in Data",
                "Australia Coronavirus Pandemic country profile",
                "https://ourworldindata.org/coronavirus/country/australia#how-many-tests-are-performed-each-day",
                "assets/ourworldindata.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "BBC Coronavirus cases",
                "Covid map: Coronavirus cases, deaths, vaccinations by country",
                "https://www.bbc.com/news/world-51235105",
                "assets/bbc_covid.png",
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
