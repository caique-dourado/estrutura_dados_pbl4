import 'package:estrutura_dados_pbl4/services/find_all.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person.dart';

class QuickSort extends StatefulWidget {
  const QuickSort({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuickSort> createState() => _QuickSortState();
}

class _QuickSortState extends State<QuickSort> {
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

  void quickSort(List<Person> list, int low, int high) async {
    final stopwatch = Stopwatch()..start(); // Inicie a contagem do tempo
    if (low < high) {
      int pivotIndex = partition(list, low, high);
      quickSort(list, low, pivotIndex - 1);
      quickSort(list, pivotIndex + 1, high);
    }
    stopwatch.stop(); // Pare a contagem do tempo

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('quickSortTime', stopwatch.elapsedMilliseconds);
  }

  int partition(List<Person> list, int low, int high) {
    Person pivot = list[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (list[j].name.compareTo(pivot.name) < 0) {
        i++;
        swap(list, i, j);
      }
    }

    swap(list, i + 1, high);
    return i + 1;
  }

  void swap(List<Person> list, int i, int j) {
    Person temp = list[i];
    list[i] = list[j];
    list[j] = temp;
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
            quickSort(sortedPersons, 0, sortedPersons.length - 1);

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
