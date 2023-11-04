import 'package:estrutura_dados_pbl4/services/find_all.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person.dart';

class MergeSort extends StatefulWidget {
  const MergeSort({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MergeSort> createState() => _MergeSortState();
}

class _MergeSortState extends State<MergeSort> {
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

  void mergeSort(List<Person> list) async {
    final stopwatch = Stopwatch()..start(); // Inicie a contagem do tempo
    if (list.length <= 1) {
      return;
    }

    final int middle = list.length ~/ 2;
    List<Person> left = list.sublist(0, middle);
    List<Person> right = list.sublist(middle);

    mergeSort(left);
    mergeSort(right);

    merge(left, right, list);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('mergeSortTime', stopwatch.elapsedMilliseconds);
  }

  void merge(List<Person> left, List<Person> right, List<Person> result) {
    int i = 0, j = 0, k = 0;

    while (i < left.length && j < right.length) {
      if (left[i].name.compareTo(right[j].name) < 0) {
        result[k] = left[i];
        i++;
      } else {
        result[k] = right[j];
        j++;
      }
      k++;
    }

    while (i < left.length) {
      result[k] = left[i];
      i++;
      k++;
    }

    while (j < right.length) {
      result[k] = right[j];
      j++;
      k++;
    }
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
            mergeSort(sortedPersons);

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
