import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({Key? key, required this.entry, this.isSaved = false})
      : super(key: key);

  final Entry entry;
  final bool isSaved;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey(entry.id),
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item removed from favorites"),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(entry: entry),
                  ),
                );
              },
              child: Ink(
                child: Row(
                  children: <Widget>[
                    Image.network(entry.image),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(entry.name),
                        Text(entry.description),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: entry
                  .commonLocationsConverter()
                  .map(
                    (location) => Chip(
                      label: Text(location),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
