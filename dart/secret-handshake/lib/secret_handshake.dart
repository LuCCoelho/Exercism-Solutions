class SecretHandshake {
  List<String> commands(int number) {
    List<String> commands = [];
    String numberBinary = number.toRadixString(2);

    while (numberBinary.length < 5) {
      numberBinary = '0' + numberBinary;
    }

    if (numberBinary[4] == '1') {
      commands.add('wink');
    }

    if (numberBinary[3] == '1') {
      commands.add('double blink');
    }

    if (numberBinary[2] == '1') {
      commands.add('close your eyes');
    }

    if (numberBinary[1] == '1') {
      commands.add('jump');
    }

    if (numberBinary[0] == '1') {
      List<String> commandsReverse = [];
      for (int i = commands.length - 1; i > -1; i--) {
        commandsReverse.add(commands[i]);
      }
      return commandsReverse;
    }

    return commands;
  }
}
