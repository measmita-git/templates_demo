import 'package:flutter/material.dart';
import 'package:searchable_menu/components/dt_dropdown.dart';
import 'package:searchable_menu/components/dt_textFormFiled.dart';
import '../components/dt_color.dart';

class SearchableOverlayScreen extends StatefulWidget {
  const SearchableOverlayScreen({Key? key}) : super(key: key);

  @override
  State<SearchableOverlayScreen> createState() =>
      _SearchableOverlayScreenState();
}

class _SearchableOverlayScreenState extends State<SearchableOverlayScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();

  List<dynamic> places = [
    {"key": "bajhang", "value": "Bajhang"},
    {"key": "bajura", "value": "Bajura"},
    {"key": "achham", "value": "Achham"},
    {"key": "doti", "value": "Doti"},
    {"key": "kailali", "value": "Kailali"},
    {"key": "kanchanpur", "value": "Kanchanpur"},
    {"key": "kalikot", "value": "Kalikot"},
    {"key": "dolpa", "value": "Dolpa"},
    {"key": "humla", "value": "Humla"},
    {"key": "jajarkot", "value": "Jajarkot"},
    {"key": "rukumWest", "value": "Rukum West"},
    {"key": "salyan", "value": "Salyan"}
  ];

  List<String> filteredCountries = [];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10, right: 10),
                child: DTDropdown(
                  prefixIcon: Icon(Icons.search),
                  options: places,
                  allowClear: true,
                  value: selectedValue,
                  fillColor: DTColor.placeholderBg,
                  placeholder: "Search For City or Places",
                  isSearchable: true,
                  onChange: (value) {
                    setState(() {
                      selectedValue = value;
                    });

                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
