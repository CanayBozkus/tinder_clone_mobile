mixin ModelMixin {
  List<String> stringToList(String listAsString){
    List<String> l = listAsString.split(',');
    l = l.map((String e) => e.trim()).toList();
    return l;
  }
}