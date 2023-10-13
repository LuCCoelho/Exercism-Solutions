class WordCount {
  Map countWords(String subtitles) {
    var word_count = new Map();
    subtitles = subtitles.toLowerCase();

    RegExp exp = RegExp(r"(\w+(['?]\w+)?)");
    Iterable<Match> matches = exp.allMatches(subtitles);
    for (final Match m in matches) {
      String word = m[0]!;
      if (word_count.containsKey(word)) {
        word_count[word] += 1;
      }
      if (!word_count.containsKey(word)) {
        word_count[word] = 1;
      }
    }

    return word_count;
  }
}
