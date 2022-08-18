class Model {
  String name;
  List<String> source;

  Model({required this.source, required this.name});
}

List<Model> data = [
  Model(source: [
    "https://raw.githubusercontent.com/CPD-TI/vibo-images/main/CANTINA/cardapio%20semanal.png",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ], name: "sb")
];
