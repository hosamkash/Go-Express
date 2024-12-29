class sharedFunctions_String {
  static String RemoveStringWords(String txt, {int countWords = 3}) {
    String finalValue = '';
    List<String> lst = txt.split(' ');
    // if (lst != null && lst.isNotEmpty)
    for (int i = 0; i <= lst.length ; i++) {
      if (lst.length == i)
        continue;

      if (i <= countWords) {
        finalValue += '${lst[i]} ';
      } else
        break;
    }
    return finalValue;
  }
}