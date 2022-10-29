import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final search = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: searchController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Search here',
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            searchController.clear();
          },
        ),
      ),
    );

    final searchButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        child: Text('Search'),
        style: ElevatedButton.styleFrom(
          primary: Colors.red[800],
        ),
        onPressed: () {

        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 400.0),
          children: <Widget>[
            search,
            const SizedBox(height: 35.0),
            searchButton,
            const SizedBox(height: 8.0,)
          ],
        ),
      ),
    );
  }
}