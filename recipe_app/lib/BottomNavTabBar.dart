import 'package:flutter/material.dart';

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.wb_sunny, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    Center(child: Icon(Icons.cake, size: 64.0, color: Colors.green))
    
  ];
  static const _kTabs = <Tab>[
    Tab(text: 'Breakfast'),
    Tab(text: 'Lunch'),
    Tab(text: 'Dinner'),
    Tab(text: 'Dessert')
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.red,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}