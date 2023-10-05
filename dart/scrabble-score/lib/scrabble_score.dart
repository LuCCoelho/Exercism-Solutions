int score(String word) {

    var finalScore = 0;

    var worth1 = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'];
    var worth2 = ['D', 'G'];
    var worth3 = ['B', 'C', 'M', 'P'];
    var worth4 = ['F', 'H', 'V', 'W', 'Y'];
    var worth5 = ['K'];
    var worth8 = ['J', 'X'];
    var worth10 = ['Q', 'Z'];

    word.runes.forEach((c) {
        var letter = new String.fromCharCode(c);
        if (worth1.contains(letter.toUpperCase())) {
            finalScore += 1;
        }

        if (worth2.contains(letter.toUpperCase())) {
            finalScore += 2;
        }

        if (worth3.contains(letter.toUpperCase())) {
            finalScore += 3;
        }

        if (worth4.contains(letter.toUpperCase())) {
            finalScore += 4;
        }

        if (worth5.contains(letter.toUpperCase())) {
            finalScore += 5;
        }

        if (worth8.contains(letter.toUpperCase())) {
            finalScore += 8;
        }

        if (worth10.contains(letter.toUpperCase())) {
            finalScore += 10;
        }
    });

    return finalScore;
}
