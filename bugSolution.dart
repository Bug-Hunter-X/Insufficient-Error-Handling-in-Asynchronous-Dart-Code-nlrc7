```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      print('Data fetched successfully: $jsonData');
    } else {
      // Handle error with more specific information
      final errorMessage = 'Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}';
      print('Error: $errorMessage');
      throw Exception(errorMessage); // Rethrowing the exception with more detail
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Error decoding JSON: $e');
    throw Exception('Invalid JSON response: $e');
  } on SocketException catch (e) {
    // Handle network errors
    print('Network Error: $e');
    throw Exception('Network error: Could not connect to the API: $e');
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    throw Exception('An unexpected error occurred: $e');
  }
}
```