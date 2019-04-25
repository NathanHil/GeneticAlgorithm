class DNA {
	String target = "is this the real life";
	char[] genes = new char[21];
	float fitness;

	DNA() {
		for (int i = 0; i < genes.length; i++) {
			genes[i] = (char) random(32, 128);
		}
	}

	void fitness() {
		int score = 0;
		for (int i = 0; i < genes.length; i++) {
			if (genes[i] == target.charAt(i)) {
				score++;
			}
		}
		fitness = float(score)/target.length();
	}
}