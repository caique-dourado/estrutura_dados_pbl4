import 'package:estrutura_dados_pbl4/services/find_all.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person.dart';

class InsertionSort extends StatefulWidget {
  const InsertionSort({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InsertionSort> createState() => _InsertionSortState();
}

class _InsertionSortState extends State<InsertionSort> {
  Future<List<Person>>? persons;
  List<Person> sortedPersons = [];

  @override
  void initState() {
    persons = PersonService().findAll();
    sortedPersons = [];
    super.initState();
  }

  Map<String, String> regionImageMap = {
    "Canada": "assets/canada.png",
    "France": "assets/france.png",
    "Germany": "assets/germany.png",
    "Mexico": "assets/mexico.png",
    "United States of America": "assets/eua.png",
  };

  void insertionSort(List<Person> list) async {
    final stopwatch = Stopwatch()..start(); // Inicie a contagem do tempo
    for (int i = 1; i < list.length; i++) {
      Person key = list[i];
      int j = i - 1;

      while (j >= 0 && list[j].name.compareTo(key.name) > 0) {
        list[j + 1] = list[j];
        j--;
      }
      list[j + 1] = key;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('insertionSortTime', stopwatch.elapsedMilliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: persons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar os dados"));
          } else {
            List<Person> sortedPersons = List.from(snapshot.data!);
            insertionSort(sortedPersons);

            return ListView.builder(
              itemBuilder: (context, index) {
                String region = sortedPersons[index].country;
                String imageAsset = regionImageMap[region]!;

                return Card(
                  child: ListTile(
                    leading:
                        CircleAvatar(backgroundImage: AssetImage(imageAsset)),
                    title: Text(sortedPersons[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sexo: ${sortedPersons[index].sex}"),
                        Text("Aniversário: ${sortedPersons[index].dtBirth}"),
                        Text("Cidade: ${sortedPersons[index].country}"),
                        Text("Ocupação: ${sortedPersons[index].occupation}"),
                        Text("Salário: \$${sortedPersons[index].salary}"),
                      ],
                    ),
                  ),
                );
              },
              itemCount: sortedPersons.length,
            );
          }
        },
      ),
    );
  }
}
