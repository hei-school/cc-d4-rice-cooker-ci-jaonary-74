class RiceCooker {
  bool isPlugged = false;
  bool isEmpty = true;
  bool isCooking = false;
}

List<dynamic> plugIn(bool status) {
  if (status) {
    return [true, Exception("Rice Cooker est déjà branché")];
  }
  return [true, null];
}

List<dynamic> unplug(bool isPlugged, bool isCooking) {
  if (!isPlugged) {
    return [true, Exception("Rice Cooker est déjà débranché")];
  } else if (isCooking) {
    return [true, Exception("Rice Cooker est déjà en cours d'utilisation")];
  }
  return [false, null];
}

List<dynamic> switchOn(bool isCooking, bool isEmpty, bool isPlugged) {
  if (isCooking) {
    return [true, Exception("Rice Cooker est déjà allumé")];
  } else if (isEmpty) {
    return [false, Exception("Rice Cooker est déjà vide")];
  } else if (!isPlugged) {
    return [false, Exception("Rice Cooker est déjà débranché")];
  }
  return [true, null];
}

List<dynamic> switchOff(bool isCooking) {
  if (!isCooking) {
    return [false, Exception("Rice Cooker est déjà éteint")];
  }
  return [false, null];
}

List<dynamic> putSomething(bool isEmpty) {
  if (!isEmpty) {
    return [false, Exception("Rice cooker est déjà rempli")];
  }
  return [false, null];
}

List<dynamic> empty(bool isEmpty, bool isCooking) {
  if (isEmpty) {
    return [true, Exception("Rice cooker est déjà vide")];
  } else if (isCooking) {
    return [false, Exception("Rice cooker est déjà en cours de cuisson")];
  }
  return [true, null];
}