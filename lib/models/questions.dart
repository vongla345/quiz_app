class Question {
  const Question(this.text, this.answer);
  final String text;
  final List<String> answer;
  List<String> get shuffleAnswer {
    List<String> shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
