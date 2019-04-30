DNA[] population = new DNA[100];
// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness
// Fitness = total number of correct characters / total characters

void setup() {
	size(800, 800);
	for (int i = 0; i < 100; i++) {
		population[i] = new DNA();
	}

	// 9.4 create population of N elements each with randomly generated DNA
	for (DNA dna : population) {
		dna.fitness();
		print(dna.fitness);
		println("");
	}
	// for (DNA d : population) {
	// 	for (char c : d.genes) {
	// 		print(c);
	// 	}
	// }
	//println("");
}

void draw() {
	background(255);
}