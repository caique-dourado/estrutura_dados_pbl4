import 'package:estrutura_dados_pbl4/screens/heap_sort.dart';
import 'package:estrutura_dados_pbl4/screens/insertion_sort.dart';
import 'package:estrutura_dados_pbl4/screens/merge_sort.dart';
import 'package:estrutura_dados_pbl4/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_page.dart';
import 'screens/quick_sort.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.deepPurple,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0)),
          primaryColor: Colors.deepPurple,
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (_) => const HomePage(title: "Página inicial"),
          "/quicksort": (_) => const QuickSort(title: "Quick Sort"),
          "/mergesort": (_) => const MergeSort(title: "Merge Sort"),
          "/insertionsort": (_) => const InsertionSort(title: "Insertion Sort"),
          "/heapsort": (_) => const HeapSort(title: "Heap Sort"),
          "/resultpage": (_) => const ResultPage(title: "Página de resultados"),
        });
  }
}
