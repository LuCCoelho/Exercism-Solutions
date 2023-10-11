class HighScores {
  List<int> scores_list; 

  HighScores(this.scores_list);

  List get scores => this.scores_list;

  int latest() => this.scores_list[this.scores_list.length - 1];

  int personalBest() {
    int best = 0;
    for (int i = 0; i < this.scores_list.length; i++) {
      if (this.scores_list[i] > best) {
        best = this.scores_list[i];
      }
    }
    return best;
  }

  List personalTopThree() {
    if (scores_list.length < 4) {
      this.scores_list.sort((b, a) => a.compareTo(b));
      return this.scores_list;
    } else {
      List<int> scores_list_copy = [];
      for (int i = 0; i < scores_list.length; i++) {
        scores_list_copy.add(this.scores_list[i]);
      }
      
      List<int> topThree = [];
      int best;

      for (int i = 0; i < 3; i++) {
        best = 0;
        for (int i = 0; i < scores_list_copy.length; i++) {
          if (scores_list_copy[i] > best) {
            best = scores_list_copy[i];
          }
        }
        topThree.add(best);   
        scores_list_copy.remove(best);
      }
      topThree.sort((b, a) => a.compareTo(b));
      return topThree;
    }
  }
}
