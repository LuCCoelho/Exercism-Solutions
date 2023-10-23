class Forth {
  List<int> stack = [];
  int stackPostition = 0;
  Map<String, List<String>> functions = new Map();
  final EmptyStack = Exception('Stack empty');
  final DivisionByZero = Exception('Division by zero');
  final UnknownCommand = Exception('Unknown command');
  final InvalidDefinition = Exception('Invalid definition');

  List<int> evaluate(String words) {
    List<String> wordsList = words.toUpperCase().split(' ');
    stackPostition = 0;

    for (int i = 0; i < wordsList.length; i++) {
      String word = wordsList[i];
      if (functions.containsKey(word)) {
        for (int j = 0; j < functions[word]!.length; j++) {
          String instruction = functions[word]![j];
          parse(instruction, wordsList, j);
        }
      } else if (parse(word, wordsList, i) == 1) {
        return stack;
      }
    }

    return stack;
  }

  int parse(String word, List<String> wordsList, int i) {
    try {
      int number = int.parse(word);
      stack.add(number);
      stackPostition++;
      return 0;
    } on FormatException {
      switch (word) {
        case ':':
          String name = wordsList[i + 1];
          List<String> commands = [];
          i++;

          try {
            int.parse(wordsList[i]);
            throw InvalidDefinition;
          } on FormatException {
            String next = wordsList[i + 1];
            while (next != ';') {
              if (functions.containsKey(next)) {
                List<String> nextInstructions = functions[next]!;
                for (String command in nextInstructions) {
                  commands.add(command);
                }
              } else {
                commands.add(next.toString());
              }
              i++;
              next = wordsList[i + 1];
            }

            functions[name] = commands;

            return 1;
          }

        case '+':
          try {
            stack[stackPostition - 2] += stack[stackPostition - 1];
            stack.removeAt(stackPostition - 1);
            stackPostition--;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case '-':
          try {
            stack[stackPostition - 2] -= stack[stackPostition - 1];
            stack.removeAt(stackPostition - 1);
            stackPostition--;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case '*':
          try {
            stack[stackPostition - 2] *= stack[stackPostition - 1];
            stack.removeAt(stackPostition - 1);
            stackPostition--;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case '/':
          try {
            if (stack[stackPostition - 1] == 0) {
              throw DivisionByZero;
            }
            stack[stackPostition - 2] ~/= stack[stackPostition - 1];
            stack.removeAt(stackPostition - 1);
            stackPostition--;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case '-':
          try {
            stack[stackPostition - 2] -= stack[stackPostition - 1];
            stack.removeAt(stackPostition - 1);
            stackPostition--;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case 'DUP':
          try {
            stack.add(stack[stackPostition - 1]);
            stackPostition++;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case 'DROP':
          try {
            stack.removeAt(stackPostition - 1);
            stackPostition--;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case 'SWAP':
          try {
            var temp = stack[stackPostition - 2];
            stack[stackPostition - 2] = stack[stackPostition - 1];
            stack[stackPostition - 1] = temp;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        case 'OVER':
          try {
            stack.add(stack[stackPostition - 2]);
            stackPostition++;
            return 0;
          } on Error {
            throw EmptyStack;
          }

        default:
          throw UnknownCommand;
      }
    }
  }
}
