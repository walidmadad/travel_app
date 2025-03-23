import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/fliters';
  final Function saveFilter;
  final Map<String, bool> currentFilters;

  const FilterScreen(this.currentFilters, this.saveFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

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
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "summer": _summer,
                "winter": _winter,
                "family": _family,
              };
              widget.saveFilter(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
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
                  _summer,
                  (newValue) {
                    setState(() {
                      _summer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Winter Travels',
                  'Show only travels for the winter season',
                  _winter,
                  (newValue) {
                    setState(() {
                      _winter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Familly Travels',
                  'Show only travels for families',
                  _family,
                  (newValue) {
                    setState(() {
                      _family = newValue;
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
