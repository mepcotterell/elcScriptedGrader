/* SampleApp.java
 *
 * This is a short description...
 *
 * Pretend that the Academic Honesty Statement is here!
 */

import static java.lang.System.in;
import static java.lang.System.out;

import java.util.Scanner;

/** A sample application
 */
public class SampleApp {

    /** Scanner for keyboard input
     */ 
    public static Scanner kb = new Scanner(in);

    /** The main program method
     *  @param args any command line arguments passed the program
     */
    public static void main (String[] args) {

	out.println("Welcome to SampleApp!");
	out.println("This program will take in two integers and add them!");
	out.println();

	out.print("Please enter the first integer: ");
	int a = kb.nextInt();

	out.print("Please enter the second integer: ");
	int b = kb.nextInt();

	out.println();
	out.printf("The sum of %d and %d is %d.\n", a, b, a+b);

    } // main

} // SampleApp