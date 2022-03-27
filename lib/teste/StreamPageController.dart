import 'dart:async';

class StreamPageController{
    final StreamController<bool> _checkboxController = StreamController<bool>();
    final StreamController<String> _nameController   = StreamController<String>();

    Stream<bool> getCheckboxStream () {
      print('_checkboxController.stream;');
      return _checkboxController.stream;
      
    }
    Sink<bool> get getCheckboxSink => _checkboxController.sink;

    Stream<String> get nameStream => _nameController.stream;
    Sink<String> get nameSink => _nameController.sink;
}