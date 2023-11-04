import 'package:estrutura_dados_pbl4/services/find_all.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/person.dart';

class HeapSort extends StatefulWidget {
  const HeapSort({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HeapSort> createState() => _HeapSortState();
}

class _HeapSortState extends State<HeapSort> {
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

  void heapSort(List<Person> list) async {
    final stopwatch = Stopwatch()..start(); // Inicie a contagem do tempo
    int n = list.length;

    for (int i = (n ~/ 2) - 1; i >= 0; i--) {
      heapify(list, n, i);
    }

    for (int i = n - 1; i > 0; i--) {
      Person temp = list[0];
      list[0] = list[i];
      list[i] = temp;

      heapify(list, i, 0);
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('heapSortTime', stopwatch.elapsedMilliseconds);
  }

  void heapify(List<Person> list, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && list[left].name.compareTo(list[largest].name) > 0) {
      largest = left;
    }

    if (right < n && list[right].name.compareTo(list[largest].name) > 0) {
      largest = right;
    }

    if (largest != i) {
      Person swap = list[i];
      list[i] = list[largest];
      list[largest] = swap;

      heapify(list, n, largest);
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
            heapSort(sortedPersons);

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
