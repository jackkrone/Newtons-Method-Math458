%{
    John Krone
    MATH 458 Fall 2019
    Project 2
    jkrone@usc.edu
%}
clear; clc;

%% solve the equation z^4 - 1 in complex coordinates using Newton's method
% first set up the problem as a vector-valued function
syms x y;
funct = @(x,y) [x^4 + y^4 - 6*x^2*y^2 - 1; 4*x^3*y - 4*x*y^3];

% find the jacobian and inverse jacobian
jac = jacobian(funct, [x,y]);
jacInv = inv(jac);
jacInvFunct = matlabFunction(jacInv);

% find results for a grid of guesses
n = 1000;
d = 2.0;
tol = 0.01;
xVec = (-1:2/n:1)*d;
yVec = (-1:2/n:1)*d;
[x,y] = meshgrid(xVec,yVec);
iterVec = zeros(size(x));
roots = cell(size(x));
for k = 1:length(x(:))
  guess = [x(k);y(k)];
  [roots{k},iterVec(k)] = newton(funct,jacInvFunct,guess,tol);
end

% Plot iteration results
a = figure;
hold on
levels = 0:5:100;
contourf(xVec,yVec,iterVec,levels)
c1 = colorbar;
c1.Label.String = 'Iterations required for convergence';
c1.Limits = [1,50];
colormap(hsv);
axis square
xlabel('Real')
ylabel('Imaginary')
title('Convergence rate countour map')
hold off

% Plot root results. This requires some modification to roots var first
% Here I will give all the roots a value so they plot on a countour map
% value 1 is root 1, 2 is root -1, 3 is root i, 4 is root -i, 5 is no sol
rootPlotVals = zeros(size(roots));
for index = 1:length(rootPlotVals(:))
    if roots{index} == [1;0]
        rootPlotVals(index) = 1;
    elseif roots{index} == [-1;0]
        rootPlotVals(index) = 2;
    elseif roots{index} == [0;1]
        rootPlotVals(index) = 3;
    elseif roots{index} == [0;-1]
        rootPlotVals(index) = 4;
    else
        rootPlotVals(index) = 5;
    end
end
b = figure;
hold on
contourf(xVec,yVec,rootPlotVals)
c2 = colorbar('Direction','reverse');
c2.Ticks = linspace(1,5,5);
c2.TickLabels = {'1','-1','i','-i','no sol'};
c2.Label.String = 'Solution';
c2.Limits = [0.8,5.2];
map = [0 1 0; 0 1 1; 1 0 0; 0 0 1; 0 0 0];
c3 = colormap(map);
axis square
xlabel('Real')
ylabel('Imaginary')
title({'Newton''s Method Root Map', '\fontsize{8}This graph shows'...
    'the root found by Newton''s Method for the given initial guess'})
hold off
