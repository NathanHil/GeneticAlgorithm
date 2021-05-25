// Yong's DNA example to create a random set
class DNA {
	char[] genes = new char[12];
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
	void fitness(String targetPhrase) {
		int score = 0;
		for (int i = 0; i < genes.length; i++) {
			if (genes[i] == targetPhrase.charAt(i)) {
				score++;
			}
		}
		fitness = float(score)/targetPhrase.length();
	}

	// Funky town. Make babies
	DNA cupidShuffle(DNA mate) {
		DNA child = new DNA();

		for (int i = 0; i < genes.length; i++) {
			float coinFlip = random(genes.length);
			if (coinFlip%2 == 0) {
				child.genes[i] = genes[i];
			}
			else {
				child.genes[i] = mate.genes[i];
			}
		}
		return child;
	}

	void mutate(float mutationRate) {
		for (int i = 0; i < genes.length; i++) {
			if (random(1) < mutationRate) {
			genes[i] = (char) random(32,128);
			}
		}
	}
}
