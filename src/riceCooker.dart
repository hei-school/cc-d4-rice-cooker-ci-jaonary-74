import 'dart:io';

import 'module.dart' as myModule;

class RiceCooker {
  bool isPlugged = false;
  bool isEmpty = true;
  bool isCooking = false;
}

void main() {
  var riceCooker = RiceCooker();

  while (true) {
    print("\nRICE COOKER");
    print("------------------------");
    print("\nMenu:\n");
    print("1- Brancher");
    print("2- Mettre du riz");
    print("3- Allumer");
    print("4- Eteindre");
    print("5- Vider");
    print("6- Débrancher");
    print("7- Quitter\n");

    var choice = stdin.readLineSync();

    if (choice == "1") {
      var result = myModule.plugIn(riceCooker.isPlugged);
      riceCooker.isPlugged = result.item1;
      var error = result.item2;
      if (error != null) {
        print("Error: $error");
      } else {
        print("\nRice Cooker branché\n");
      }
    } else if (choice == "2") {
      var result = myModule.putSomething(riceCooker.isEmpty);
      riceCooker.isEmpty = result.item1;
      var error = result.item2;
      if (error != null) {
        print("Error: $error");
      } else {
        print("\nRice Cooker prêt!\n");
      }
    } else if (choice == "3") {
      var result = myModule.switchOn(
        riceCooker.isCooking,
        riceCooker.isEmpty,
        riceCooker.isPlugged,
      );
      riceCooker.isCooking = result.item1;
      var error = result.item2;
      if (error != null) {
        print("Error: $error");
      } else {
        print("\nRice Cooker allumé!\n");
      }
    } else if (choice == "4") {
      var result = myModule.switchOff(riceCooker.isCooking);
      riceCooker.isCooking = result.item1;
      var error = result.item2;
      if (error != null) {
        print("Error: $error");
      } else {
        print("\nRice Cooker éteint!\n");
      }
    } else if (choice == "5") {
      var result = myModule.empty(riceCooker.isEmpty, riceCooker.isCooking);
      riceCooker.isEmpty = result.item1;
      var error = result.item2;
      if (error != null) {
        print("Error: $error");
      } else {
        print("\nVotre rice cooker est vide, mettez quelque chose à cuire!\n");
      }
    } else if (choice == "6") {
      var result = myModule.unplug(riceCooker.isPlugged, riceCooker.isCooking);
      riceCooker.isPlugged = result.item1;
      var error = result.item2;
      if (error != null) {
        print("Error: $error");
      } else {
        print("\nRice Cooker débranché!\n");
      }
    } else if (choice == "7") {
      print("Au revoir !!");
      break;
    } else {
      print("");
    }
  }
}