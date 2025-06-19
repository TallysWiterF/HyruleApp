import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/components/entry_card.dart';

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Saved items"),
        ),
        body: FutureBuilder(
          future: daoController.getAllEntries(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Entry>> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => EntryCard(
                      entry: snapshot.data![index],
                      isSaved: true,
                    ),
                    itemCount: snapshot.data!.length,
                  );
                }
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
