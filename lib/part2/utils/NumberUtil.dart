//解析字符串的文字内容
//把 25014512 变成2501 万

String parseNumbers(String counts, String infos, {int fractionDigits = 0}) {
  int intData = int.parse(counts);
  String results = "";
  if (intData >= 10000) {
    double newData = intData / 10000;
    results = "${newData.toStringAsFixed(fractionDigits)}万 ${infos}";
  } else {
    results = "${counts} ${infos}";
  }
  return results;
}

int parseNumber2Int(String counts) {
  return int.parse(counts);
}
