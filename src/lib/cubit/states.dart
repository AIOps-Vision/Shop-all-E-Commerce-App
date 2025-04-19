abstract class States {}

class InitialState extends States {}

class ButtomSheet extends States {
  //   final bool isPasswordShow; //here you can don't send it//between curly you can pass any data you need
//   TrueState(this.isPasswordShow); // to its constructor here you can don't send it
}

class CreateData extends States {}

class InsertData extends States {}

class GetData extends States {}

class GetLoadData extends States {} // this for load circle on screen

class UpdateData extends States {}

class DeleteData extends States {}

class ChoosenData extends States {
  final String selectedItem;
  ChoosenData(this.selectedItem);
}

class ChoosenSelectData extends States {
  String? select;

  ChoosenSelectData(this.select);
}
