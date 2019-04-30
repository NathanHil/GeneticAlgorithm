// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness
// Fitness = total number of correct characters / total characters
DNA[] population;
String targetPhrase;
float mutationRate = 0.01;
int populationSize = 150;
PFont font;
int generation = 0;


void setup() {
	size(1600, 800);
	targetPhrase = "cat";

	population = new DNA[populationSize];
	for ( int i = 0; i < population.length; i++) {
		population[i] = new DNA();
	}
	font = createFont("Courier",50,true);
}

void draw() {
	background(0);
	for (int i = 0; i < population.length; i++) {
		population[i].fitness(targetPhrase);
	}

	ArrayList<DNA> matingPool = new ArrayList<DNA>();

	// Add to the mating pool
	for (int i = 0; i < population.length; i++) {
		int randomMultiplier = int(population[i].fitness * 100);
		for (int j = 0; j < randomMultiplier; j++) {
			matingPool.add(population[i]);
		}
	}

	// Mutate with random parents
	for (int i = 0; i < population.length; i++) {
		int randA = int(random(matingPool.size()));
		int randB = int(random(matingPool.size()));
		DNA mom = matingPool.get(randA);
		DNA dad = matingPool.get(randB);
		DNA child = mom.cupidShuffle(dad);
		child.mutate(mutationRate);
		population[i] = child;
	}
	
	generation++;

	fill(255);
	textFont(font,50);
	text("Current Mutation: "+population[0].getPhrase(), 50, 100);
	text("Gen #"+generation, width-500, 50);
	text("Best Fit: "+bestFit(), width-500, 150);
}