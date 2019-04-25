class DNA {
	// is this the real life
	char[] genes = new char[21]
	
	DNA() {
		for (char i : genes) {
			i = (char) random(32, 128);
		}
	}
}