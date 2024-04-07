import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rise_up_media_mobile/src/controllers/api_service.dart';
import 'package:rise_up_media_mobile/src/views/widgets/bars/top_bar.dart';
import 'package:rise_up_media_mobile/src/views/widgets/cards/card_non_dated.dart';
import 'package:rise_up_media_mobile/src/views/widgets/drawers/left_drawer.dart';

class EventCalender extends StatefulWidget {
  const EventCalender({Key? key}) : super(key: key);

  @override
  State<EventCalender> createState() => _EventCalenderState();
}

class _EventCalenderState extends State<EventCalender> {
  TextEditingController _dateController = TextEditingController();
  bool _filter = false;
  ApiService apiService = ApiService();
  DateTime today = DateTime.now();
  List<dynamic> _myNonDatedCardData = [];

  @override
  void initState() {
    super.initState();
    fetchEventByDate(today.toString().split(" ")[0]);
  }

  Future<void> fetchEventByDate(String? date) async {
    try {
      // Call fetchData method from ApiService
      Response response = await apiService.fetchEventByDate(date!);
      setState(() {
        // Parse the response data and map it to myNonDatedCardData
        _myNonDatedCardData = response.data;
      });
    } catch (error) {
      // Handle error
      print('Error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const MyAppBar(),
        drawer: const MyLeftDrawer(),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const SizedBox(height: 20),
                  _filter
                      ? SizedBox(
                          width: 200,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _dateController,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 32,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _filter = false;
                                    fetchEventByDate(
                                        today.toString().split(" ")[0]);
                                  });
                                },
                              ),
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                            style:
                                TextStyle(fontSize: 28), // Increase text size
                          ),
                        )
                      : const Text(
                          "Today Events",
                          style: TextStyle(fontSize: 32),
                        ),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _filter = true;
                      });
                      _selectDate(context);
                    },
                    child: const Icon(
                      Icons.calendar_month,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SizedBox(
                child: Center(
                    child: ListView.builder(
                        itemCount: _myNonDatedCardData.length,
                        itemBuilder: (context, index) {
                          return MyNonDatedCard(
                            title: _myNonDatedCardData[index]['title']!,
                            description: _myNonDatedCardData[index]
                                ['short_description']!,
                            id: _myNonDatedCardData[index]["_id"],
                            image: _myNonDatedCardData[index]['banner_link'],
                          );
                        })),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      String formattedDate = _picked.toString().split(" ")[0];

      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
      fetchEventByDate(formattedDate);
    }
  }
}
