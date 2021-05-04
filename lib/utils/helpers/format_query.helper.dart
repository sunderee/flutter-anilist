String formatQuery(String rawQuery) => rawQuery
    .replaceAll(RegExp(r'\n'), '')
    .replaceAll(RegExp(r'\s+'), ' ')
    .replaceAll(RegExp(r'((?<=\{)\s)|(\s((?=\{)|(?=\})))'), '');
