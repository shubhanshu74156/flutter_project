// https://m3.material.io/components/lists/overview#07f4df2c-2003-4b4b-aacc-626d62827667
// import it in dashboard and populate
// HeadElement - Title center aligned Todays events
// LeftElement - Icons
// right Alinment - Paragaraph
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNonDatedCard extends StatelessWidget {
  final String title, description, id, image;
  const MyNonDatedCard(
      {super.key,
      required this.title,
      required this.description,
      required this.id,
      required this.image});

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
      child: ListTile(
        onTap: () {
          var myObject = {
            "id": id,
          };
          context.go(
            "/details",
            extra: myObject,
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image), // Set image as background
          radius: 25,
          child: const Icon(Icons.event), // Set the radius of the circle avatar
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
