class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List<String>.from(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

const questions = [
  QuizQuestion(
    'Ktorý jazyk sa používa na vývoj aplikácií vo Flutteri?',
    [
      'Dart',
      'Java',
      'Python',
      'C',
    ],
  ),
  QuizQuestion(
    'Kto vytvoril Flutter?',
    [
      'Google',
      'Microsoft',
      'Apple',
      'Meta',
    ],
  ),
  QuizQuestion(
    'Ktorý widget sa používa na vytvorenie stĺpca widgetov?',
    [
      'Column',
      'Row',
      'Stack',
      'Container',
    ],
  ),
  QuizQuestion(
    'Ktorý widget umožňuje meniť stav obrazovky?',
    [
      'StatefulWidget',
      'StatelessWidget',
      'MaterialApp',
      'Text',
    ],
  ),
  QuizQuestion(
    'Ktorá metóda sa používa na aktualizáciu stavu vo Flutteri?',
    [
      'setState()',
      'updateScreen()',
      'refreshPage()',
      'changeState()',
    ],
  ),
  QuizQuestion(
    'Čo robí metóda map() v jazyku Dart?',
    [
      'Transformuje každý prvok zoznamu',
      'Vymaže celý zoznam',
      'Zoradí prvky podľa abecedy',
      'Zastaví aplikáciu',
    ],
  ),
  QuizQuestion(
    'Ktorý widget slúži na zobrazovanie textu?',
    [
      'Text',
      'Icon',
      'Scaffold',
      'Expanded',
    ],
  ),
  QuizQuestion(
    'Čo znamená skratka UI?',
    [
      'User Interface',
      'Universal Internet',
      'User Information',
      'Unique Identifier',
    ],
  ),
  QuizQuestion(
    'Ktorý widget umožňuje posúvať obsah obrazovky?',
    [
      'SingleChildScrollView',
      'Center',
      'Padding',
      'SizedBox',
    ],
  ),
  QuizQuestion(
    'Aký je hlavný účel Fluttera?',
    [
      'Vývoj používateľských rozhraní aplikácií',
      'Správa databázových serverov',
      'Tvorba operačných systémov',
      'Úprava fotografií',
    ],
  ),
];