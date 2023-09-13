import 'package:flutter/material.dart';

class ContainerItem {
  bool isSelected;
  String title;

  ContainerItem({required this.isSelected, required this.title});
}

class CheckboxContainerListScreen extends StatefulWidget {
  @override
  _CheckboxContainerListScreenState createState() =>
      _CheckboxContainerListScreenState();
}

class _CheckboxContainerListScreenState
    extends State<CheckboxContainerListScreen> {
  List<ContainerItem> containerItems = [
    ContainerItem(isSelected: false, title: 'Container 1'),
    ContainerItem(isSelected: false, title: 'Container 2'),
    ContainerItem(isSelected: false, title: 'Container 3'),
  ];

  ValueNotifier<int> selectedContainerIndex = ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Container List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: containerItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(containerItems[index].title),
                  leading: ValueListenableBuilder<int>(
                    valueListenable: selectedContainerIndex,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value == index,
                        onChanged: (selected) {
                          setState(() {
                            if (selected!) {
                              selectedContainerIndex.value = index;
                            } else {
                              selectedContainerIndex.value = -1;
                            }
                          });
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform an action with the selected container
              if (selectedContainerIndex.value != -1) {
                ContainerItem selectedContainer =
                containerItems[selectedContainerIndex.value];
                print('Selected Container: ${selectedContainer.title}');
              } else {
                print('No container selected.');
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CheckboxContainerListScreen(),
  ));
}