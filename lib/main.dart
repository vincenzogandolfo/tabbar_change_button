import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String selectedTab = "";
  late Function selectedTabFunction;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    setState(() {
      if (tabController.index == 0) {
        selectedTab = "1";
        selectedTabFunction = _functionForTab1;
      } else {
        selectedTab = "2";
        selectedTabFunction = _functionForTab2;
      }
    });
  }

  void _functionForTab1() {
    // Inserisci qui la tua funzione per la scheda 1
  }

  void _functionForTab2() {
    // Inserisci qui la tua funzione per la scheda 2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: "Tab 1"),
            Tab(text: "Tab 2"),
          ],
          onTap: (index) => _onTabChanged(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("Contenuto scheda 1")),
          Center(child: Text("Contenuto scheda 2")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedTabFunction();
          });
        },
        child: Text(selectedTab),
      ),
    );
  }
}
