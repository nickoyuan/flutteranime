import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'details_page.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    required this.title,
    required this.closedBuilder
  });

  final CloseContainerBuilder closedBuilder;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, openContainer) => DetailsPage(title),
      closedBuilder: closedBuilder,
    );
  }
}