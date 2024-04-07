// Head elements- title center aligned upcoming events
// https://m3.material.io/components/lists/overview#0519c023-de10-4062-9e4d-4c6918245b1a
// date in right side
// title and paragraph left side

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyDatedCard extends StatelessWidget {
  final String title, description, date, id, image;
  const MyDatedCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              var myObject = {"id": id};

              context.go("/details", extra: myObject);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image), // Set image as background
              radius: 25,
              child: const Icon(
                  Icons.event), // Set the radius of the circle avatar
            ),
            title: Text(title),
            subtitle: Text(description),
            trailing: Text(date),
          )
        ],
      ),
    );
  }
}
