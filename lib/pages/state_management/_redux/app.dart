import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hello/pages/state_management/item.dart';
import 'package:redux/redux.dart';

import '_store.dart';

class App extends StatelessWidget {
  final store =
      Store<AppState>(appReducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page(title: 'Redux Sample'),
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
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () {
            store.dispatch(
                AddItemAction(payload: Item(title: DateTime.now().toString())));
          };
        },
        builder: (context, onPressedCallback) {
          return FloatingActionButton(
            onPressed: onPressedCallback,
            tooltip: 'Add',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Item>>(
      converter: (store) => store.state.items,
      builder: (context, items) {
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
            );
          },
        );
      },
    );
  }
}
