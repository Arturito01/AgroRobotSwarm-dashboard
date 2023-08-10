extension CustomSet on Set {
  void replace<T>(int index, T newValue) {
    if (contains(newValue)) return;
    int counter = 0;
    while (counter < length) {
      var element = first;
      remove(element);
      if (counter == index) element = newValue;
      add(element);
      counter++;
    }
  }
}
