import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<List<int>>? getListTime;
  List<String> ordenationList = [
    "Quick Sort",
    "Merge Sort",
    "Insertion Sort",
    "Heap sort",
    "Counting Sort"
  ];

  Future<List<int>> getResults() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int quickSortTime = prefs.getInt('quickSortTime') ?? 0;
    final int mergeSortTime = prefs.getInt('mergeSortTime') ?? 0;
    final int insertionSortTime = prefs.getInt('insertionSortTime') ?? 0;
    final int heapSortTime = prefs.getInt('heapSortTime') ?? 0;

    return [
      quickSortTime,
      mergeSortTime,
      insertionSortTime,
      heapSortTime,
    ];
  }

  @override
  void initState() {
    getListTime = getResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getListTime,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar os resultados"));
          } else {
            var results = snapshot.data as List<int>;

            List<ChartSampleData> chartData = [];
            for (int i = 0; i < results.length; i++) {
              chartData.add(ChartSampleData(ordenationList[i], results[i]));
            }

            return Column(
              children: [
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Tempo de Execução'),

                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<ChartSampleData, String>>[
                    ColumnSeries<ChartSampleData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartSampleData time, _) => time.label,
                      yValueMapper: (ChartSampleData time, _) => time.value,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(this.label, this.value);

  final String label;
  final int value;
}
