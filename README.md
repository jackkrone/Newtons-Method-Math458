# Newtons Method Fractal Geometry Project

### Overview:
This is a project I completed in Numerical Methods (MATH 458) at USC. The task was, broadly speaking, to create a visual representation of the rate of convergence for Newton's Method depending on the initial value provided. Newton's Method is an iterative method for identifying a root of a given function. Starting with an initial guess, Newton's method outputs successive new values each closer than the last to a valid root of the given function. Generally speaking, we assume that the further the initial guess is from a root of the function the slower the rate of convergence (i.e. the more iterations required before a valid root is identified). This is not entirely true though, as you will see.

### Newton's Method:
The following is repeated, starting with the initial guess *x<sub>0</sub>*, and ending when *| x<sub>n</sub> - x<sub>n-1</sub> | < M* where *M* is some predetermined threshold indicating a sufficiently close value has been reached.

*x<sub>n+1</sub> = x<sub>n</sub> - f(x<sub>n</sub>)/f'(x<sub>n</sub>)*

Further reading: https://en.wikipedia.org/wiki/Newton's_method

### Getting started:
Start by downloading the writeup and skimming the overview of my work. Mapping the convergence rate of Newton's method on top of the location of initial guesses for the root of a function in the complex plane produce interesting fractal geometries. There are many charts in the writeup that display these fractals. The code to create the fractals is included in the .m files.

Example fractals:

![image](https://user-images.githubusercontent.com/37680054/129309264-2d174702-2873-4b04-90c5-56a80e7bf2f9.png)![image](https://user-images.githubusercontent.com/37680054/129309369-f4651320-cf57-41af-85c1-c45ec70d7479.png)


