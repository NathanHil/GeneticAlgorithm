DNA[] population = new DNA[100];
// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness
// Fitness = total number of correct characters / total characters
String targetPhrase;
int populationSize = 150;


void setup() {
	size(800, 200);
	targetPhrase = "is this the real life";

	population = new DNA[populationSize];
	for ( int i = 0; i < population.length; i++) {
		population[i] = new DNA();
	}
}

void draw() {
	background(255);
	DNA newDNA = new DNA();
	if (isPhrase(newDNA)) {
		exit();
	}
}