import 'package:flutter/material.dart';
import 'package:searchlog/views/cards/accommodation.dart';
import 'package:searchlog/views/cards/shared_accommodation.dart';
import 'package:searchlog/views/cards/student_accomodation.dart';
import 'package:searchlog/views/cards/travel.dart';
import 'package:searchlog/views/centered_view.dart';
import 'cards/car.dart';
import 'cards/covid.dart';
import 'cards/covid_test.dart';
import 'cards/finance.dart';
import 'cards/flights.dart';
import 'cards/funny.dart';
import 'cards/game.dart';
import 'cards/job_search.dart';
import 'cards/manga.dart';
import 'cards/music.dart';
import 'cards/news.dart';
import 'cards/shopping.dart';
import 'cards/top_places.dart';
import 'cards/vaccination.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 39, 39, 37), title: Text(title)),
      body: CenteredView(child: showTitleDetails(title)),
    );
  }

  showTitleDetails(String title) {
    switch (title) {
      case "Covid Statistics":
        return Covid();
      case "Vaccination":
        return Vaccination();
      case "Covid Testing Sites":
        return CovidTest();
      case "News":
        return News();
      case "Flights":
        return Flights();
      case "Shared Accommodations":
        return SharedAccommodation();
      case "Student Accommodations":
        return StudentAccommodation();
      case "Travel":
        return Travel();
      case "Hotel":
        return Hotel();
      case "Private Accommodation":
        return Accommodation();
      case "Game":
        return GameView();
      case "Shopping":
        return Shopping();
      case "Manga":
        return Manga();
      case "Car":
        return Car();
      case "Music":
        return Music();
      case "Finance":
        return Finance();
      case "Job Search":
        return JobSearch();
      case "Funny":
        return Funny();
    }
  }
}