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

DNA[] population = new DNA[100];
// Determine the fitness of each element of the population and breed the good ones
// Also introduce mutation to introduce ordered randomness
// Fitness = total number of correct characters / total characters

public void setup() {
	
	for (int i = 0; i < 100; i++) {
		population[i] = new DNA();
	}

	// 9.4 create population of N elements each with randomly generated DNA
	for (DNA dna : population) {
		dna.fitness();
		print(dna.fitness);
		println("");
	}
	for (DNA d : population) {
		for (char c : d.genes) {
			print(c);
		}
		println("");
	}
}

public void draw() {
	background(255);
}
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

	public void fitness() {
		int score = 0;
		for (int i = 0; i < genes.length; i++) {
			if (genes[i] == target.charAt(i)) {
				score++;
			}
		}
		fitness = PApplet.parseFloat(score)/target.length();
	}
}
  public void settings() { 	size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GeneticAlgorithm" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
