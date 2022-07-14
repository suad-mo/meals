import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  // const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  // ignore: use_key_in_widget_constructors
  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegeterian = widget.currentFilters['vegeterian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(
        description,
      ),
      value: currentValue,
      onChanged: (val) => updateValue(val),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) => setState(
                    () {
                      _glutenFree = newValue;
                    },
                  ),
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include laktosa-free meals.',
                  _lactoseFree,
                  (newValue) => setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  ),
                ),
                _buildSwitchListTile(
                  'Vegeterian',
                  'Only include vegeterian meals.',
                  _vegeterian,
                  (newValue) => setState(
                    () {
                      _vegeterian = newValue;
                    },
                  ),
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) => setState(
                    () {
                      _vegan = newValue;
                    },
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
