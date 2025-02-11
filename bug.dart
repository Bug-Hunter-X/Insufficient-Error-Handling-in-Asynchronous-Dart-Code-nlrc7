```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // ...
    } else {
      // Handle error
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, including network errors, JSON decoding errors, etc.
    print('Error fetching data: $e');
    // Consider rethrowing the exception or handling it appropriately based on your application's needs.
    rethrow; // Rethrowing allows calling functions to handle the error.
  }
}
```