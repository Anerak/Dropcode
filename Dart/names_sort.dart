String meeting(String s) {
  List<String> dirtyList = s.split(';');
  List<String> cleanList = [];
  for (String invitation in dirtyList) {
    List<String> tmp = invitation.toUpperCase().split(':');
    cleanList.add("(${tmp.last}, ${tmp.first})");
  }
  cleanList.sort();
  return cleanList.join('');
}

void main() {
  print(meeting(
      "Alexis:Wahl;John:Bell;Victoria:Schwarz;Abba:Dorny;Grace:Meta;Ann:Arno;Madison:STAN;Alex:Cornwell;Lewis:Korn;Megan:Stan;Alex:Korn"));
}
