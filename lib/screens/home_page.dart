import 'package:estrutura_dados_pbl4/widgets/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ButtonPerson(
            onPressed: () => Navigator.pushNamed(context, "/quicksort"),
            name: "Quick Sort",
            context: context,
          ),
          ButtonPerson(
            onPressed: () => Navigator.pushNamed(context, "/mergesort"),
            name: "Merge Sort",
            context: context,
          ),
          ButtonPerson(
            onPressed: () => Navigator.pushNamed(context, "/insertionsort"),
            name: "Insertion Sort",
            context: context,
          ),
          ButtonPerson(
            onPressed: () => Navigator.pushNamed(context, "/heapsort"),
            name: "Heap Sort",
            context: context,
          ),
          ButtonPerson(
            onPressed: () => Navigator.pushNamed(context, "/resultpage"),
            name: "Ver resultado",
            context: context,
          ),
        ]),
      ),
    );
  }
}
