import 'package:flutter/material.dart';
import 'dt_dropdown.dart';

class DTValueSearch extends SearchDelegate<String> {
  final List<DTDropdownModal> names;
  late DTDropdownModal result;

  DTValueSearch(this.names);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = names.where((name) {
      return name.toString().toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index).value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            result = suggestions.elementAt(index);
            close(context, result.key);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = names.where((name) {
      return name.toString().toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index).value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // query = suggestions.elementAt(index);
            result = suggestions.elementAt(index);
            close(context, result.key);
          },
        );
      },
    );
  }
}
