import 'package:flutter/material.dart';
import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';
import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:Payirseai/presentation/choose_module/pages/market_analysis/data_service.dart';

class MarketInsightsPage extends StatefulWidget {
  const MarketInsightsPage({super.key});

  @override
  _CsvDataScreenState createState() => _CsvDataScreenState();
}

class _CsvDataScreenState extends State<MarketInsightsPage> {
  List<List<dynamic>>? _data;
  String? _selectedState;
  String? _selectedDistrict;
  final dataService = DataService();

  // Map commodity names to image asset paths
  final Map<String, String> _commodityImages = {
    'Tomato': 'assets/images/Tomato.png',
    'Potato': 'assets/images/potato.png',
    'Gur (Jaggery)':'assets/images/Gur (Jaggery).png',
    'Indian Beans (Seam)':'assets/images/Indian Beans (Seam).png',
    'Jack Fruit':'assets/images/Jack Fruit.png',
    'Jamun (Narale Hannu)':'assets/images/Jamun (Narale Hannu).png',
    'Jasmine':'assets/images/Jasmine.png',
    'Jowar (Sorghum)':'assets/images/Jowar (Sorghum).png',
    'kakada':'assets/images/kakada.png',
    'Karbuja (Musk Melon)':'assets/images/Karbuja (Musk Melon).png',
    'Kartali (Kantola)':'assets/images/Kartali (Kantola).png',
    

    
    // Add other commodities and their corresponding images here
  };

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    try {
      await dataService.fetchData();
      final data = await dataService.readCsvFile();
      setState(() {
        _data = data;
      });
      print('CSV Data Loaded: ${_data?.length} rows');
      if (_data != null && _data!.isNotEmpty) {
        print('First row: ${_data![0]}');
      }
    } catch (e) {
      print('Error loading CSV data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text('Market Insights',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w800),), 
      ),
      body: Stack(
        
        children: [
          Positioned.fill(child: Opacity(opacity: .1,child:  Image.asset('assets/appimages/abi.png',fit: BoxFit.cover,),)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _data == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                              border: Border.all(color: AppColors.primary, width: 2.0),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Select State'),
                              alignment: Alignment.center,
                              value: _selectedState,
                              items: _data!
                                  .skip(1) // Skip header row
                                  .map((row) => row[0] as String) // Ensure row[0] is a string
                                  .toSet()
                                  .map((state) => DropdownMenuItem<String>(
                                        value: state,
                                        child: Center(child: Text(state)),
                                      ))
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedState = value;
                                  _selectedDistrict = null;
                                });
                                print('Selected State: $value');
                              },
                              dropdownColor: Colors.white,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color.fromARGB(99, 255, 255, 255),
                              border: Border.all(color: AppColors.primary, width: 2.0),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Select District'),
                              alignment: Alignment.center,
                              value: _selectedDistrict,
                              items: _selectedState == null
                                  ? []
                                  : _data!
                                      .skip(1) // Skip header row
                                      .where((row) => row[0] == _selectedState)
                                      .map((row) => row[1] as String) // Ensure row[1] is a string
                                      .toSet()
                                      .map((district) => DropdownMenuItem<String>(
                                            value: district,
                                            child: Center(child: Text(district)),
                                          ))
                                      .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedDistrict = value;
                                });
                                print('Selected District: $value');
                              },
                              dropdownColor: Colors.white,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView(
                            children: _data!
                                .skip(1) // Skip header row
                                .where((row) =>
                                    row[0] == _selectedState &&
                                    (_selectedDistrict == null || row[1] == _selectedDistrict))
                                .map((row) => Card(
                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Container(
                                            width: 80, // Adjust width as needed
                                            height: 80, // Adjust height as needed
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  _commodityImages[row[3]] ?? 'assets/images/icon2.png',
                                                  // Fallback image
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'State: ${row[0]}',
                                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                'District: ${row[1]}',
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                'Market: ${row[2]}',
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                'Commodity: ${row[3]}',
                                                style: const TextStyle(color: Colors.green, fontSize: 16),
                                              ),
                                              Text(
                                                'Arrival Date: ${row[6]}',
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                'Min Price: ${row[7]}',
                                                style: const TextStyle(color: Colors.lightGreen, fontSize: 16),
                                              ),
                                              Text(
                                                'Max Price: ${row[8]}',
                                                style: const TextStyle(color: Colors.red, fontSize: 16),
                                              ),
                                              Text(
                                                'Modal Price: ${row[9]}',
                                                style: const TextStyle(color: Colors.blue, fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
