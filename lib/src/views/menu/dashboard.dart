import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rise_up_media_mobile/src/controllers/api_service.dart';
import 'package:rise_up_media_mobile/src/views/widgets/bars/top_bar.dart';
import 'package:rise_up_media_mobile/src/views/widgets/cards/card_dated.dart';
import 'package:rise_up_media_mobile/src/views/widgets/cards/card_non_dated.dart';
import 'package:rise_up_media_mobile/src/views/widgets/drawers/left_drawer.dart';
import 'dart:convert';

List<Map<String, String>> myNonDatedCardData = [
  {
    "title": "Title 1",
    "description": "Description 1",
    "_id": "6606d70aaa23ecea228996f7"
  },
  {
    "title": "Title 2",
    "description": "Description 2",
    "_id": "6606d70aaa23ecea228996f7"
  },
  {
    "title": "Title 3",
    "description": "Description 3",
    "_id": "6606d70aaa23ecea228996f7"
  },
  {
    "title": "Title 4",
    "description": "Description 4",
    "_id": "6606d70aaa23ecea228996f7"
  },
];

const List<Map<String, String>> myDatedCardData = [
  {"title": "Hello", "description": "Description 1", "date": "Date 1"},
  {"title": "Title 2", "description": "Description 2", "date": "Date 2"},
  {"title": "Title 3", "description": "Description 3", "date": "Date 3"},
  {"title": "Title 4", "description": "Description 4", "date": "Date 4"},
  {"title": "Title 5", "description": "Description 5", "date": "Date 5"},
  {"title": "Title 6", "description": "Description 6", "date": "Date 6"},
];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> _todayEventData = [];
  List<dynamic> _upcomingEventData = [];
  bool _isLoading = true;
  bool _hasError = false;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchTodayEventData();
    fetchUpcomingEventData();
  }

  Future<void> fetchTodayEventData() async {
    try {
      Response response = await apiService.fetchTodayEvents();
      setState(() {
        _todayEventData = response.data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchUpcomingEventData() async {
    try {
      Response response = await apiService.fetchUpcomingEvents();

      setState(() {
        _upcomingEventData = response.data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: const MyAppBar(),
          drawer: const MyLeftDrawer(),
          body: Center(
            child: Column(children: [
              const SizedBox(height: 20),
              const Text(
                "Today Events",
                style: TextStyle(fontSize: 32),
              ),
              Card(
                child: SizedBox(
                  height: 300,
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _hasError
                          ? const Center(
                              child: Text('Error fetching data'),
                            )
                          : Center(
                              child: ListView.builder(
                                  itemCount: _todayEventData.length,
                                  itemBuilder: (context, index) {
                                    return MyNonDatedCard(
                                      title: _todayEventData[index]['title']!,
                                      description: _todayEventData[index]
                                          ['short_description']!,
                                      id: _todayEventData[index]['_id']!,
                                      image: _todayEventData[index]
                                          ['banner_link'],
                                    );
                                  })),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Upcoming Events",
                style: TextStyle(fontSize: 32),
              ),
              Card(
                child: SizedBox(
                  height: 300,
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _hasError
                          ? const Center(
                              child: Text('Error fetching data'),
                            )
                          : Center(
                              child: ListView.builder(
                                itemCount: _upcomingEventData.length,
                                itemBuilder: (context, index) {
                                  return MyDatedCard(
                                    title: _upcomingEventData[index]['title']!,
                                    description: _upcomingEventData[index]
                                        ['short_description']!,
                                    date: _upcomingEventData[index]['date']!,
                                    id: _upcomingEventData[index]['_id']!,
                                    image: _upcomingEventData[index]
                                        ['banner_link'],
                                  );
                                },
                              ),
                            ),
                ),
              ),
            ]),
          )),
    );
  }
}
