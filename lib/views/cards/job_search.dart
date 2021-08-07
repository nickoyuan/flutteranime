import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSearch extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Job Search",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.book,
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
                  "Websites for best job searches in Australia",
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
                "Seek",
                "SEEK is Australia's number one employment marketplace. Find jobs and career related information or recruit the ideal candidate. ",
                "https://www.seek.com.au/",
                "assets/seek.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "LinkedIn",
                "LinkedIn is an American business and employment-oriented online service that operates via websites and mobile apps",
                "https://au.linkedin.com/jobs",
                "assets/linkedin.jpeg",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Jora",
                "Browse jobs with Jora. More than 250000 jobs, all on one job search site. ",
                "https://au.jora.com//",
                "assets/jora.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Indeed",
                "With Indeed, you can search millions of jobs online to find the next step in your career. ",
                "https://au.indeed.com/",
                "assets/indeed.jpeg",
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
