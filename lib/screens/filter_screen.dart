import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  static const screenRoute = '/fliters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isInSommer = false;
  var _isInWInter = false;
  var _isForFamilly = false;

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    ValueChanged<bool> updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter')),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Summer Travels',
                  'Show only travels for the summer season',
                  _isInSommer,
                  (newValue) {
                    setState(() {
                      _isInSommer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Winter Travels',
                  'Show only travels for the winter season',
                  _isInWInter,
                  (newValue) {
                    setState(() {
                      _isInWInter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Familly Travels',
                  'Show only travels for families',
                  _isForFamilly,
                  (newValue) {
                    setState(() {
                      _isForFamilly = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
