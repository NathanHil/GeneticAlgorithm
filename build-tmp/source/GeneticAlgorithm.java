import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GeneticAlgorithm extends PApplet {

// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness
// Fitness = total number of correct characters / total characters
DNA[] population;
String targetPhrase;
float mutationRate = 0.01f;
int populationSize = 150;
PFont font;
int generation = 0;


public void setup() {
	
	targetPhrase = "cat";

	population = new DNA[populationSize];
	for ( int i = 0; i < population.length; i++) {
		population[i] = new DNA();
	}
	font = createFont("Courier",50,true);
}

public void draw() {
	background(0);
	for (int i = 0; i < population.length; i++) {
		population[i].fitness(targetPhrase);
	}

	ArrayList<DNA> matingPool = new ArrayList<DNA>();

	// Add to the mating pool
	for (int i = 0; i < population.length; i++) {
		int randomMultiplier = PApplet.parseInt(population[i].fitness * 100);
		for (int j = 0; j < randomMultiplier; j++) {
			matingPool.add(population[i]);
		}
	}

	// Mutate with random parents
	for (int i = 0; i < population.length; i++) {
		int randA = PApplet.parseInt(random(matingPool.size()));
		int randB = PApplet.parseInt(random(matingPool.size()));
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
}
// Yong's DNA example to create a random set
class DNA {
	char[] genes = new char[3];
	float fitness;

	DNA() {
		for (int i = 0; i < genes.length; i++) {
			genes[i] = (char) random(32, 128);
		}
	}

	// Convert and return character list into string
	public String getPhrase() {
		return new String(genes);
	}

	// Calculate the fitness 
	public void fitness(String targetPhrase) {
		int score = 0;
		for (int i = 0; i < genes.length; i++) {
			if (genes[i] == targetPhrase.charAt(i)) {
				score++;
			}
		}
		fitness = PApplet.parseFloat(score)/targetPhrase.length();
	}

	// Funky town. Make babies
	public DNA cupidShuffle(DNA mate) {
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

	public void mutate(float mutationRate) {
		for (int i = 0; i < genes.length; i++) {
			if (random(1) < mutationRate) {
			genes[i] = (char) random(32,128);
			}
		}
	}
}
  public void settings() { 	size(1600, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GeneticAlgorithm" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
