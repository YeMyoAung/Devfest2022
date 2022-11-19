import 'dart:collection';

const String lorem =
    """Sunt exercitation consequat aliqua ipsum est commodo ad occaecat id. Ipsum reprehenderit magna nostrud elit dolore mollit sunt cupidatat est exercitation ex eiusmod est. Enim eu eu ex amet culpa. Cupidatat duis laboris dolor esse reprehenderit irure officia cupidatat. Proident do excepteur est mollit ad. Ipsum laboris eu duis sint sit esse officia non. Esse ex minim et magna consequat quis nostrud aliqua laboris elit culpa pariatur et.""";

Map<String, dynamic> normalMap = {
  "a": "Mg Mg",
  "b": "Aung Aung",
  "c": "Su Su",
  "e": "Hla Hla",
};

// class A<xString,xInt,xList,xMap> {
//   final xString a;
// }

final SplayTreeMap<String, String> splayTreeMap =
    SplayTreeMap<String, String>.from({
  "a": "mg mg",
  "b": "aung aung",
  "c": "su su",
  "e": "hla hla",
}, (key, key1) => key1.compareTo(key));

typedef Widget = String;
typedef BuildContext = String;
typedef WidgetBuilder = Widget Function(BuildContext, List, int);

abstract class HomeScreenProvider {
  final List<String> products = [];

  List get();
}

class HomeScreenProviderImply extends HomeScreenProvider with GetProductMixin {}

mixin GetProductMixin on HomeScreenProvider {
  @override
  List get() {
    return products;
  }
}

class AddProductMixin {
  void add(String name) {}
}

class UpdateProductMixin {}

class NotificationBuilder {
  final WidgetBuilder builder;
  NotificationBuilder({
    required this.builder,
  });
}

class OrderBuilder {
  final WidgetBuilder builder;
  OrderBuilder({
    required this.builder,
  });
}

void main(List<String> arguments) {
  try {} catch (e, s) {
    print(s);
  }

  HomeScreenProviderImply().get();

  print(normalMap);
  print(splayTreeMap);
  normalMap.addEntries({MapEntry('d', 'Aye Aye')});
  splayTreeMap.addEntries({MapEntry('d', 'aye aye')});
  print(normalMap);
  print(splayTreeMap);
  // performanceTest("Normal String", normalConact);
  // performanceTest("StringBuffer", stringbufferConcat);
}

void performanceTest(String name, void Function() callback) {
  final Stopwatch stopwatch = Stopwatch()..start();

  callback();

  stopwatch.stop();

  print("$name end in : ${stopwatch.elapsedMicroseconds}");
}

void normalConact() {
  String name = '';

  for (var i = 0; i < 3000; i++) {
    name += lorem;
  }

  print(name.length);
}

void stringbufferConcat() {
  final StringBuffer buffer = StringBuffer();
  for (var i = 0; i < 3000; i++) {
    buffer.write(lorem);
  }
  buffer.clear();
  print(buffer.toString());
}
