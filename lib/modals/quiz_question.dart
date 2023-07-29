class QuizQuestion {
  const QuizQuestion(this.text, this.answer);
  final String text;

  final List<String> answer;

  List<String> getSuffleAnswer() {
    final suffledList = List.of(answer);
    suffledList.shuffle();
    return suffledList;
  }
}
