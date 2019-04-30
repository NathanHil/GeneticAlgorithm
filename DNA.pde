// Yong's DNA example to create a random set
class DNA {
	String target = "is this the real life";
	char[] genes = new char[21];
	float fitness;

	DNA() {
		for (int i = 0; i < genes.length; i++) {
			genes[i] = (char) random(32, 128);
		}
	}

	// Convert and return character list into string
	String getPhrase() {
		return new String(genes);
	}

	// Calculate the fitness 
	void fitness() {
		int score = 0;
		for (int i = 0; i < genes.length; i++) {
			if (genes[i] == target.charAt(i)) {
				score++;
			}
		}
		fitness = float(score)/target.length();
	}

	// Funky town
	DNA cupidShuffle(DNA mate) {
		DNA child = new DNA();

		for (int i = 0; i < genes.length; i++) {
			if (i%2 == 0) {
				child.genes[i] = genes[i];
			}
			else {
				child.genes[i] = mate.genes[i];
			}
		}
	}
}