 function [root,iter] = newtonMod(funct,jacFunct,guess,tol)
   %NEWTONMOD  [root,ind] = newton(funct,jacFunct,guess,tol).
   % Newton's method for some function "funct" and Jacobian 
   % "jacFunct" at some initial point "guess". Returns the root and the
   % number of iterations i for convergence.
   iter = 0;
   updVec = guess;
   % I added the last while condition to avoid an infinite loop
      while norm(updVec-[1;0]) > tol && norm(updVec-[-1;0]) > tol &&...
              norm(updVec-[0;1]) > tol && norm(updVec-[0;-1]) > tol ...
              && iter < 500
         iter = iter+1;
         updVec = -(jacFunct(updVec(1),updVec(2))) \ funct(updVec(1),updVec(2)) + updVec;
      end
      root = round(updVec);
   end