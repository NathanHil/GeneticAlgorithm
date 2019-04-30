DNA[] population = new DNA[100];
// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness
// Fitness = total number of correct characters / total characters
String targetPhrase;


void setup() {
	size(800, 800);
	targetPhrase = "is this the real life";
}

void draw() {
	background(255);
	DNA newDNA = new DNA();
	if (isPhrase(newDNA)) {
		exit();
	}
}