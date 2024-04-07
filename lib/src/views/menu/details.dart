import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up_media_mobile/src/controllers/api_service.dart';

class CardDetails extends StatefulWidget {
  final Map<String, String> myObject;
  const CardDetails({Key? key, required this.myObject}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetails> {
  late Map<String, String> _myObjectDetails;
  ApiService apiService = ApiService();
  Map<String, dynamic> _eventData = {};

  @override
  void initState() {
    super.initState();
    _myObjectDetails = widget.myObject;
    fetchEventData(_myObjectDetails['id']);
  }

  Future<void> fetchEventData(String? id) async {
    try {
      Response response = await apiService.fetchEventById(id!);
      print(response);
      setState(() {
        _eventData = response.data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _eventData['title'] ?? '',
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/dashboard"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: SizedBox(
                height: 450,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        _eventData['banner_link'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 315,
                        errorBuilder: (context, error, stackTrace) {
                          // ErrorWidget will be displayed if the image fails to load
                          return Image.network(
                            'https://t3.ftcdn.net/jpg/02/48/42/64/240_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg', // Provide your fallback image URL here
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      // Text(
                      //   _eventData['title'] ?? '',
                      //   textAlign: TextAlign.left,
                      //   style: const TextStyle(
                      //     fontSize: 28,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      Text(
                        _eventData['short_description'] ?? '',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: ExpansionTile(
                title: const Text('Tell me more'),
                children: <Widget>[
                  Text(
                    _eventData['long_description'] ?? '',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: const Text('YouTube'),
                children: <Widget>[
                  SizedBox(
                    height: 300, // Set a fixed height
                    child: ListView.builder(
                      itemCount: _eventData['links']?.length ?? 0,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0), // Add bottom padding
                          child: HtmlWidget(
                            '<iframe width="560" height="315" src="${_eventData['links'][index]}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: const Text('Document'),
                children: <Widget>[
                  DataTable(
                    headingRowHeight: 0,
                    columns: const [
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                    ],
                    rows: _eventData['pdfs'].map<DataRow>((pdf) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Row(
                              children: [
                                const Icon(Icons.picture_as_pdf),
                                const SizedBox(
                                    width:
                                        8), // Add spacing between icon and text
                                Text(pdf['name'] ?? ''),
                              ],
                            ),
                          ),
                          DataCell(
                            IconButton(
                              icon: const Icon(Icons.download),
                              onPressed: () {
                                // Implement download action
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
