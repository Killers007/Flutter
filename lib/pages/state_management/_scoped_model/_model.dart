import 'package:hello/pages/state_management/item.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  List<Item> _items = sampleItems;

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);

    notifyListeners();
  }
}
