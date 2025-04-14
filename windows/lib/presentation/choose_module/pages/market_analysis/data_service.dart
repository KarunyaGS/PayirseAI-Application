import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'dart:convert';

class DataService {
  final String apiUrl = 'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001d3d4126243cf4f64747fd411b0c9e113&format=csv';

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/data.csv';
        final file = File(path);
        await file.writeAsBytes(response.bodyBytes);
        print('Data saved to $path');
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<List<List<dynamic>>> readCsvFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/data.csv';
      final file = File(path);

      if (await file.exists()) {
        final input = file.openRead();
        final fields = await input
            .transform(utf8.decoder)
            .transform(const CsvToListConverter(eol: '\n'))
            .toList();
        print('CSV File Read Successfully');
        return fields;
      } else {
        throw Exception('CSV file not found');
      }
    } catch (e) {
      print('Error reading CSV file: $e');
      throw e;
    }
  }
}
