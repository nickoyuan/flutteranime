

import 'package:flutter/material.dart';

class GridList {
  const GridList({required this.title, required this.img});
  final String title;
  final String img;
}

const List<GridList> choices = const <GridList>[
  const GridList(title: 'Covid Statistics', img: "assets/front_page/covid.jpg"),
  const GridList(title: 'Vaccination', img: "assets/front_page/vaccine.jpg"),
  const GridList(title: 'Covid Testing Sites', img: "assets/front_page/covid_test.jpg"),
  const GridList(title: 'News', img: "assets/front_page/news_front.jpg"),
  const GridList(title: 'Job Search', img: "assets/front_page/job.jpg"),
  const GridList(title: 'Game', img: "assets/front_page/game.jpg"),
  const GridList(title: 'Funny', img: "assets/front_page/funny.jpg"),
  const GridList(title: 'Shopping', img: "assets/front_page/shopping.jpg"),
  const GridList(title: 'Manga', img: "assets/front_page/anime.jpg"),
  const GridList(title: 'Travel', img: "assets/front_page/travel.jpg"),
  const GridList(title: 'Car', img: "assets/front_page/car.jpg"),
  const GridList(title: 'Music', img: "assets/front_page/music.jpg"),
  const GridList(title: 'Finance', img: "assets/front_page/finance.jpg"),
  const GridList(title: 'Hotel', img: "assets/front_page/hotel.jpg"),
  const GridList(title: "Private Accommodation", img: "assets/front_page/accommodations.jpg"),
  const GridList(title: 'Student Accommodations', img: "assets/front_page/student.jpg"),
  const GridList(title: 'Shared Accommodations', img: "assets/front_page/shared_accommodations.jpg"),

];

/*
 const GridList(title: 'Gambling', img: "assets/front_page/gambling.jpg"),

  const GridList(title: 'Sports', img: "assets/front_page/sport.jpg"),
  const GridList(title: 'Social', img: "assets/front_page/social.jpg"),
 */
//  const GridList(title: 'Bank', img: "assets/front_page/bank.jpg"),