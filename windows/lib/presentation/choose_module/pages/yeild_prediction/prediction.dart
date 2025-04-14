import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';
import 'package:Payirseai/data/common/widgets/button/basic_app_button.dart';
import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CropPredictionForm extends StatefulWidget {
  @override
  _CropPredictionFormState createState() => _CropPredictionFormState();
}

class _CropPredictionFormState extends State<CropPredictionForm> {
  String state = "State";
  String district = "District";
  String crop = "Crop";
  String season = "Season";
  String area = '';
  String production = '';
  String rainfall = '';
  String ph = '';
  String nitrogen = '';
  String phosphorus = '';
  String potassium = '';

  final List<String> _dropdownOptions1 = [
    "State",
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Laddakh",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

   
  

  final List<String> _dropdownOptions2 = [
    "District",
    "24 PARAGANAS NORTH",
    "24 PARAGANAS SOUTH",
    "ADILABAD",
    "AGAR MALWA",
    "AGRA",
    "AHMADABAD",
    "AHMEDNAGAR",
    "AIZAWL",
    "AJMER",
    "AKOLA",
    "ALAPPUZHA",
    "ALIGARH",
    "ALIPURDUAR",
    "ALIRAJPUR",
    "ALLAHABAD",
    "ALMORA",
    "ALWAR",
    "AMBALA",
    "AMBEDKAR NAGAR",
    "AMETHI",
    "AMRAVATI",
    "AMRELI",
    "AMRITSAR",
    "AMROHA",
    "ANAND",
    "ANANTAPUR",
    "ANANTNAG",
    "ANJAW",
    "ANUGUL",
    "ANUPPUR",
    "ARARIA",
    "ARAVALLI",
    "ARIYALUR",
    "ARWAL",
    "ASHOKNAGAR",
    "AURAIYA",
    "AURANGABAD",
    "AZAMGARH",
    "BADGAM",
    "BAGALKOT",
    "BAGALKOTE",
    "BAGESHWAR",
    "BAGHPAT",
    "BAHRAICH",
    "BAKSA",
    "BALAGHAT",
    "BALANGIR",
    "BALESHWAR",
    "BALLARI",
    "BALLIA",
    "BALOD",
    "BALODA BAZAR",
    "BALRAMPUR",
    "BANAS KANTHA",
    "BANDA",
    "BANDIPORA",
    "BANGALORE RURAL",
    "BANKA",
    "BANKURA",
    "BANSWARA",
    "BARABANKI",
    "BARAMULLA",
    "BARAN",
    "BAREILLY",
    "BARGARH",
    "BARMER",
    "BARNALA",
    "BARPETA",
    "BARWANI",
    "BASTAR",
    "BASTI",
    "BATHINDA",
    "BEED",
    "BEGUSARAI",
    "BELAGAVI",
    "BELGAUM",
    "BELLARY",
    "BEMETARA",
    "BENGALURU URBAN",
    "BETUL",
    "BHADRADRI",
    "BHADRAK",
    "BHAGALPUR",
    "BHANDARA",
    "BHARATPUR",
    "BHARUCH",
    "BHAVNAGAR",
    "BHILWARA",
    "BHIND",
    "BHIWANI",
    "BHOJPUR",
    "BHOPAL",
    "BIDAR",
    "BIJAPUR",
    "BIJNOR",
    "BIKANER",
    "BILASPUR",
    "BIRBHUM",
    "BISHNUPUR",
    "BISWANATH",
    "BOKARO",
    "BONGAIGAON",
    "BOTAD",
    "BOUDH",
    "BUDAUN",
    "BULANDSHAHR",
    "BULDHANA",
    "BUNDI",
    "BURHANPUR",
    "BUXAR",
    "CACHAR",
    "CHAMARAJANAGAR",
    "CHAMARAJANAGARA",
    "CHAMBA",
    "CHAMOLI",
    "CHAMPAWAT",
    "CHAMPHAI",
    "CHANDAULI",
    "CHANDEL",
    "CHANDIGARH",
    "CHANDRAPUR",
    "CHANGLANG",
    "CHARAIDEO",
    "CHARKI DADRI",
    "CHATRA",
    "CHENGALPATTU",
    "CHHATARPUR",
    "CHHINDWARA",
    "CHHOTAUDEPUR",
    "CHIKBALLAPUR",
    "CHIKKABALLAPURA",
    "CHIKKAMAGALURU",
    "CHIKMAGALUR",
    "CHIRANG",
    "CHITRADURGA",
    "CHITRAKOOT",
    "CHITTOOR",
    "CHITTORGARH",
    "CHURACHANDPUR",
    "CHURU",
    "COIMBATORE",
    "COOCHBEHAR",
    "CUDDALORE",
    "CUTTACK",
    "DADRA AND NAGAR HAVELI",
    "DAKSHIN KANNAD",
    "DAKSHINA KANNADA",
    "DAMAN",
    "DAMOH",
    "DANG",
    "DANTEWADA",
    "DARBHANGA",
    "DARJEELING",
    "DARRANG",
    "DATIA",
    "DAUSA",
    "DAVANGERE",
    "DEHRADUN",
    "DELHI_TOTAL",
    "DEOGARH",
    "DEOGHAR",
    "DEORIA",
    "DEVBHUMI DWARKA",
    "DEWAS",
    "DHALAI",
    "DHAMTARI",
    "DHANBAD",
    "DHAR",
    "DHARMAPURI",
    "DHARWAD",
    "DHEMAJI",
    "DHENKANAL",
    "DHOLPUR",
    "DHUBRI",
    "DHULE",
    "DIBANG VALLEY",
    "DIBRUGARH",
    "DIMA HASAO",
    "DIMAPUR",
    "DINAJPUR DAKSHIN",
    "DINAJPUR UTTAR",
    "DINDIGUL",
    "DINDORI",
    "DIU",
    "DODA",
    "DOHAD",
    "DUMKA",
    "DUNGARPUR",
    "DURG",
    "Daman and Diu",
    "Delhi",
    "EAST DISTRICT",
    "EAST GARO HILLS",
    "EAST GODAVARI",
    "EAST JAINTIA HILLS",
    "EAST KAMENG",
    "EAST KHASI HILLS",
    "EAST SIANG",
    "EAST SINGHBUM",
    "ERNAKULAM",
    "ERODE",
    "ETAH",
    "ETAWAH",
    "FAIZABAD",
    "FARIDABAD",
    "FARIDKOT",
    "FARRUKHABAD",
    "FATEHABAD",
    "FATEHGARH SAHIB",
    "FATEHPUR",
    "FAZILKA",
    "FIROZABAD",
    "FIROZEPUR",
    "GADAG",
    "GADCHIROLI",
    "GAJAPATI",
    "GANDERBAL",
    "GANDHINAGAR",
    "GANGANAGAR",
    "GANJAM",
    "GARHWA",
    "GARIYABAND",
    "GAURELLA-PENDRA-MARWAHI",
    "GAUTAM BUDDHA NAGAR",
    "GAYA",
    "GHAZIABAD",
    "GHAZIPUR",
    "GIR SOMNATH",
    "GIRIDIH",
    "GOALPARA",
    "GODDA",
    "GOLAGHAT",
    "GOMATI",
    "GONDA",
    "GONDIA",
    "GOPALGANJ",
    "GORAKHPUR",
    "GULBARGA",
    "GUMLA",
    "GUNA",
    "GUNTUR",
    "GURDASPUR",
    "GURGAON",
    "GWALIOR",
    "Goa",
    "HAILAKANDI",
    "HAMIRPUR",
    "HANUMAKONDA",
    "HANUMANGARH",
    "HAPUR",
    "HARDA",
    "HARDOI",
    "HARIDWAR",
    "HASSAN",
        "HATHRAS",
    "HAVELI",
    "HAZARIBAGH",
    "HINGOLI",
    "HOSHANGABAD",
    "HOSHIERPUR",
    "HUBLI",
    "HUBLI-DHARWAD",
    "HUNGAHALLI",
    "HUPRI",
    "Idukki",
    "IMPHAL EAST",
    "IMPHAL WEST",
    "INDORE",
    "INDORE DISTRICT",
    "JABALPUR",
    "JAGATSINGHPUR",
    "JAGTIAL",
    "JAMMU",
    "JAMMU & KASHMIR",
    "JAMTARA",
    "JANJGIR-CHAMPA",
    "JAPLA",
    "JASHPUR",
    "JHABUA",
    "JHALAWAR",
    "JHANSI",
    "JHARKHAND",
    "JHARSUGUDA",
    "JHUNJHUNU",
    "JIGANJ",
    "JOGULAMBA GADWAL",
    "JODHPUR",
    "JORHAT",
    "KABIRDHAM",
    "KADAPA",
    "KAGAZNAGAR",
    "KAILASHNAGAR",
    "KAKKAD",
    "KAKINADA",
    "KALABURAGI",
    "KALIMPONG",
    "KALPETTA",
    "KALYAN DOMBIVLI",
    "KAMRUP",
    "KAMRUP METROPOLITAN",
    "KANAGAWAL",
    "KANHANGAD",
    "KANPUR",
    "KANYAKUMARI",
    "KARAIKAL",
    "KARANJA",
    "KARIMGANJ",
    "KARNAL",
    "KARUNAGAPALLY",
    "KASARGOD",
    "KASHMIR",
    "KASIMNAGAR",
    "KATHUA",
    "KATIHAR",
    "KATNI",
    "KENDAL",
    "KENDUJHAR",
    "KESHORAI PATAN",
    "KHAGARIA",
    "KHAMMAM",
    "KHANDWA",
    "KHARGONE",
    "KHUSHAB",
    "KICKAT",
    "KISHANGARH",
    "KISHOREGANJ",
    "KISHOREGANJ DISTRICT",
    "KISHTWAR",
    "KNAUR",
    "KOLHAPUR",
    "KOLLAM",
    "KORBA",
    "KORAPUT",
    "KOTHAMANGALAM",
    "KOTA",
    "KOTTAYAM",
    "KOTTAPURAM",
    "KOTTAYAM DISTRICT",
    "KRAKOW",
    "KUMBAKONAM",
    "KURNOOL",
    "KURUKSHETRA",
    "KUSHINAGAR",
    "LALITPUR",
    "LAKHIMPUR",
    "LAKHISARAI",
    "LAHUL AND SPITI",
    "LATEHAR",
    "LAUDERDALE",
    "LEH",
    "LEH DISTRICT",
    "LUDHIANA",
    "LUCKNOW",
    "MADHUBANI",
    "MADHYA KASHI",
    "MADURAI",
    "MAGADH",
    "MAHARAJGANJ",
    "MAHASAMUND",
    "MAHENDRAGARH",
    "MAHOBE",
    "MAHRASTHRA",
    "MAI-KALAI",
    "MAJULI",
    "MANCHERIAL",
    "MANGALORE",
    "MANIPUR",
    "MANJHAT",
    "MANSI",
    "MATHURA",
    "MAU",
    "MEERUT",
    "MEXICO",
    "MIZORAM",
    "MONGOLIA",
    "MORADABAD",
    "MORBI",
    "MUZAFFARNAGAR",
    "MUZAFFARPUR",
    "NALANDA",
    "NALBARI",
    "NANDURBAR",
    "NANDYAL",
    "NARMADA",
    "NARSINGHPUR",
    "NAWADA",
    "NAWANSHAHR",
    "NAYAGARH",
    "NEEMUCH",
    "NENWAL",
    "NIDHRA",
    "NIGAM",
    "NIZAMABAD",
    "NOIDA",
    "NORTH AND MIDDLE ANDAMAN",
    "NORTH DINAJPUR",
    "NORTH GOA",
    "NORTH KANYAKUMARI",
    "NORTH LAKHIMPUR",
    "NORTH SIKKIM",
    "NORTH SIKKIM DISTRICT",
    "NORTH TWIN CITIES",
    "NUAPADA",
    "NUAPADA DISTRICT",
    "OCH",
    "ODISHA",
    "ONGOLE",
    "OULBA",
    "PACHMARHI",
    "PACHORA",
    "PADERU",
    "PADRAUNA",
    "PALI",
    "PALGHAR",
    "PALWAN",
    "PANCHKULA",
    "PANCHMAHAL",
    "PANDEY",
    "PANNA",
    "PARDI",
    "PARKHARA",
    "PARLAR",
    "PATIALA",
    "PATNA",
    "PERNAMIT",
    "PERSIS",
    "PHEK",
    "PHULWARISARIF",
    "PIA",
    "PIMPRI-CHINCHWAD",
    "PITIGULI",
    "PUNJAB",
    "PURI",
    "PURNIA",
    "RAIGAD",
    "RAIGAD DISTRICT",
    "RAIGARH",
    "RAIPUR",
    "RAISEN",
    "RAJGIR",
    "RAJKOT",
    "RAJKOT DISTRICT",
    "RAJMAHAL",
    "RAJNANDGAON",
    "RAJKOT DISTRICT",
    "RAMANAGAR",
    "RAMAPUR",
    "RAMBAGH",
    "RAMKUND",
    "RAMPUR",
    "RANAGHAT",
    "RANJAN",
    "RANCHI",
    "RATANGARH",
    "RATLAM",
    "RAYAGADA",
    "REWA",
    "REWARI",
    "RUDRAPUR",
    "RUPNAGAR",
    "SADAR",
    "SADAR BAZAR",
    "SAGAR",
    "SAGAR DISTRICT",
    "SAHARANPUR",
    "SAI",
    "SAIBAB",
    "SAKET",
    "SALEM",
    "SALUMBAR",
    "SAMASTIPUR",
    "SAMBALPUR",
    "SAMBA",
    "SANGRUR",
    "SANGRUR DISTRICT",
    "SANT KABIR NAGAR",
    "SANT RAVIDAS NAGAR",
    "SANTAL PARGANA",
    "SANTHIPUR",
    "SATARA",
    "SATNA",
    "SATYABHAMA",
    "SEHORE",
    "SELOKUBAD",
    "SERAMPORE",
    "SEVAPUR",
    "SHADNAGAR",
    "SHAMLI",
    "SHARDA NAGAR",
    "SHIMLA",
    "SHIMOGA",
    "SHRAVASTI",
    "SHRIGANGANAGAR",
    "SHRIRAMPUR",
    "SIKAR",
    "SIKKIM",
    "SITAMARHI",
    "SITAPUR",
    "SIVAGANGA",
    "SIVSAGAR",
    "SOLAN",
    "SOLAPUR",
    "SOME",
    "SONEBHADRA",
    "SONBHADRA",
    "SONITPUR",
    "SONITPUR DISTRICT",
    "SORABA",
    "SRIKAKULAM",
    "SRIKOT",
    "SRINAGAR",
    "SUIDARA",
    "SULTANPUR",
    "SUNDARGARH",
    "SURENDRANAGAR",
    "SUTRAPADA",
    "TAMENDA",
    "TAMHATTA",
    "TAMULI",
    "TARAI",
    "TARN TARAN",
    "TEHRI GARHWAL",
    "TEHRI GARHWAL DISTRICT",
    "THANE",
    "THANJAVUR",
    "THOUBAL",
    "THRISSUR",
    "TIKAMGARH",
    "TINSUKIA",
    "TIRAP",
    "TIRUNELVELI",
    "TIRUPUR",
    "TIRUPATI",
    "TOHANG",
    "TRIBENI",
    "TUMKUR",
    "TUNGA",
    "TURKI",
    "TUTICORIN",
    "UDAIPUR",
    "UDAIPUR DISTRICT",
    "UDALGURI",
    "UDHAMPUR",
    "UDHAYN",
    "UJJAIN",
    "ULUBERIA",
    "UNAKOTI",
    "UNNAO",
    "UNNATAPUR",
    "URAN",
    "VAISHALI",
    "VALSAD",
    "VANDAVASI",
    "VARANASI",
    "VASCO",
    "VAYU",
    "VIJAYAPUR",
    "VIRUDHUNAGAR",
    "VIZIANAGARAM",
    "VIZIANAGARAM DISTRICT",
    "WADALA",
    "WADIYA",
    "WALAJAPET",
    "WANHAL",
    "WARDHA",
    "WARANGAL",
    "WARANGAL DISTRICT",
    "WARISALIGANJ",
    "WEST GARO HILLS",
    "WEST GODAVARI",
    "WEST KAMENG",
    "WEST KHASI HILLS",
    "WEST SIANG",
    "WEST SIKKIM",
    "WEST SIKKIM DISTRICT",
    "YADGIR",
    "YAMUNANAGAR",
    "YAVATMAL",
    "ZP_JH",
  ];



  final List<String> _dropdownOptions3 = [
    "Crop",
    "Arecanut",
    "Arhar/Tur",
    "Bajra",
    "Banana",
    "Barley",
    "Black pepper",
    "Cardamom",
    "Cashewnut",
    "Castor seed",
    "Coconut",
    "Coriander",
    "Cotton(lint)",
    "Cowpea(Lobia)",
    "Dry Ginger",
    "Dry chillies",
    "Garlic",
    "Ginger",
    "Gram",
    "Groundnut",
    "Guar seed",
    "Horse-gram",
    "Jowar",
    "Jute",
    "Khesari",
    "Linseed",
    "Maize",
    "Masoor",
    "Mesta",
    "Moong(Green Gram)",
    "Moth",
    "Niger seed",
    "Oilseeds total",
    "Onion",
    "Other Cereals",
    "Other Kharif pulses",
    "Other Rabi pulses",
    "Other Summer Pulses",
    "Peas & beans (Pulses)",
    "Potato",
    "Ragi",
    "Rapeseed & Mustard",
    "Rice",
    "Safflower",
    "Sannhamp",
    "Sesamum",
    "Small millets",
    "Soyabean",
    "Sugarcane",
    "Sunflower",
    "Sweet potato",
    "Tapioca",
    "Tobacco",
    "Turmeric",
    "Urad",
    "Wheat",
    "other oilseeds",

  ];


  final List<String> _dropdownOptions4 = [
    'Season',
    "Autumn",
    "Kharif",
    "Rabi",
    "Summer",
    "Whole Year",
    "Winter", 
  ];


  String predictionResult = ''; // State variable to hold prediction result

  Future<void> submitForm() async {
    try {
      final url = Uri.parse('http://deevith.pythonanywhere.com/predict'); // Update if needed
      final body = json.encode({
        'State': state,
        'District': district,
        'Crop': crop,
        'Season': season,
        'Area': double.tryParse(area) ?? 0.0,
        'Production': double.tryParse(production) ?? 0.0,
        'Rainfall': double.tryParse(rainfall) ?? 0.0,
        'pH': double.tryParse(ph) ?? 0.0,
        'N (mg/kg)': double.tryParse(nitrogen) ?? 0.0,
        'P (mg/kg)': double.tryParse(phosphorus) ?? 0.0,
        'K (mg/kg)': double.tryParse(potassium) ?? 0.0,
      });

      print('Sending request to $url with body: $body');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          predictionResult = data['prediction'].toString();
        });
      } else {
        setState(() {
          predictionResult = 'Error: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        predictionResult = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text('Crop Yield Prediction',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w800),), 

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/appimages/abi.png'),fit: BoxFit.cover,opacity: 0.25)
        ),
        child: SingleChildScrollView(
          child: Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                _dropdownview1(),
                SizedBox(height: 10,),
                _dropdownview2(),
                SizedBox(height: 10,),
                _dropdownview3(),
                SizedBox(height: 10,),
                _dropdownview4(),
                SizedBox(height: 10,),
                _textField1(),
                SizedBox(height: 10,),
                _textField2(),
                SizedBox(height: 10,),
                _textField3(),
                SizedBox(height: 10,),
                _textField4(),
                SizedBox(height: 10,),
                _textField5(),
                SizedBox(height: 10,),
                _textField6(),
                SizedBox(height: 10,),
                _textField7(),
                SizedBox(height: 10,),
                BasicAppButton(onPressed: submitForm, title: 'Predict'),
                _outputPrediction(),
                
              ],
            ),
          ),
        ),
      ),
      
      
    );
  }

  Widget _dropdownview1() {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color:AppColors.primary.withOpacity(.2), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    value: state,
    onChanged: (String? newValue) {
      setState(() {
        state = newValue!;
      });
    },
    items: _dropdownOptions1.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
Widget _dropdownview2() {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    value: district,
    onChanged: (String? newValue) {
      setState(() {
        district = newValue!;
      });
    },
    items: _dropdownOptions2.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
Widget _dropdownview3() {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    value: crop,
    onChanged: (String? newValue) {
      setState(() {
        crop = newValue!;
      });
    },
    items: _dropdownOptions3.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
Widget _dropdownview4() {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    value: season,
    onChanged: (String? newValue) {
      setState(() {
        season = newValue!;
      });
    },
    items: _dropdownOptions4.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
Widget _textField1() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter Area (hectare)',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        area = value;
      });
    },
  );
}
Widget _textField2() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter Production (hectogram)',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        production = value;
      });
    },
  );
}
Widget _textField3() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter RainFall (mm)',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        rainfall = value;
      });
    },
  );
}
Widget _textField4() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter pH',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        ph = value;
      });
    },
  );
}
Widget _textField5() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter Nitrogen (mg/kg)',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        nitrogen = value;
      });
    },
  );
}
Widget _textField6() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter Phosphorus (mg/kg)',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        phosphorus = value;
      });
    },
  );
}
Widget _textField7() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Enter Potassium (mg/kg)',
      labelStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.withOpacity(.2), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      filled: true,
      fillColor: Colors.white,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      setState(() {
        potassium = value;
      });
    },
  );
}

Widget _outputPrediction() {
  return Container(
    padding: EdgeInsets.all(16.0),
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      border: Border.all(color: AppColors.primary, width: 1.0),
    ),
    child: Text(
      'Prediction Result: $predictionResult (hg/ha)',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),
  );
}

}


