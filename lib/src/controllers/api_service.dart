import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio(); // Create Dio instance

  Future<Response> fetchEventByDate(String date) async {
    try {
      Response response =
          await dio.get('http://localhost:3000/events/date/$date');
      return response;
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow error to handle it in the calling code
    }
  }

  Future<Response> fetchTodayEvents() async {
    try {
      Response response = await dio.get('http://localhost:3000/events/today');
      return response;
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow error to handle it in the calling code
    }
  }

  Future<Response> fetchUpcomingEvents() async {
    try {
      Response response =
          await dio.get('http://localhost:3000/events/upcoming');
      return response;
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow error to handle it in the calling code
    }
  }

  Future<Response> fetchEventById(String id) async {
    try {
      Response response = await dio.get('http://localhost:3000/events/id/$id');
      return response;
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow error to handle it in the calling code
    }
  }
}
