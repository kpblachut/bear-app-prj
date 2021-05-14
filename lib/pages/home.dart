import 'package:flutter/material.dart';
import 'feed.dart';
import 'trainings_list.dart';
import 'history.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _tabChanged(){
    if (_tabController.indexIsChanging) {
      print('Tab Changed: ${_tabController.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            FeedPage(),
            TrainingsListPage(),
            HistoryPage(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[600],
          tabs: [
            Tab(
              icon: Icon(Icons.poll_outlined),
              text: 'Feed',
            ),
            Tab(
              icon: Icon(Icons.fitness_center_outlined),
              text: 'Trainings',
            ),
            Tab(
              icon: Icon(Icons.calendar_today_outlined),
              text: 'History',
            ),
          ],
        ),
      ),
    );
  }
}