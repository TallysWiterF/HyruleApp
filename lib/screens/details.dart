import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.entry}) : super(key: key);
  final Entry entry;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                entry.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                entry.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Image.network(entry.image),
              const SizedBox(height: 16.0),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            daoController.saveEntry(entry: entry);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${entry.name} added to favorites!'),
              ),
            );
          },
          child: const Icon(Icons.bookmark),
        ),
      ),
    );
  }
}
