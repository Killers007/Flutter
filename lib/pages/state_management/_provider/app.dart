import 'package:flutter/material.dart';
import 'package:hello/pages/state_management/item.dart';
import 'package:provider/provider.dart';

import '_state.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        // title: 'Provider Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page2(title: 'Provider Sample'),
      ),
    );
  }
}

class Page extends StatelessWidget {
  Page({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = Provider.of<AppState>(context, listen: false);
          state.addItem(Item(title: DateTime.now().toString()));
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = Provider.of<AppState>(context, listen: false);
          state.addItem(Item(title: DateTime.now().toString()));
        },
        tooltip: 'Adds',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.items[index].title),
            );
          },
        );
      },
    );
  }
}
