DNA[] population = new DNA[100];
// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness

void setup() {
	size(800, 800);
	for (int i = 0; i < 100; i++) {
		population[i] = new DNA();
	}
	for (DNA d : population) {
		for (char c : d.genes) {
			print(c);
		}
	}
	println("");
}

void draw() {
	background(255);
}