% using genetic algorithm to find solution of a multivariate equation.
clc;
clear all;
%%
% Plotting the function for visualization
clc;
x = 0:100;
y = 0:100;
z = 0:100;
[X,Y,Z] = meshgrid(x,y,z);
res = 2*X.*Z.*exp(-X) - 2*Y.^3 + Y.^2 -3*Z.^3;
% spheresize = 10;
% scatter3(X, Y, Z, spheresize, res)
%surf(X,Y,res(0:1))
%%
sliceomatic(res)
%%
% Varaibles necessary for builtin function
% Performing Minimization
clc;
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0 0 0] ;
ub = [100 100 100];
FitnessFunction = @equation;
nvars = 3;
%x = ga(fun,nvars,A,b,Aeq,beq,lb,ub)
[p_min,f_min,exitFlag,output_min]=ga(FitnessFunction,nvars,A,b,Aeq,beq,lb,ub);
fprintf('The number of generations was : %d\n', output_min.generations);
fprintf('The Values that optimizize minimum are X={%f} , Y={%f} , Z={%f}\n',p_min(1),p_min(2),p_min(3))
fprintf('The Function Value at minimum is %f\n ',f_min)
 

%%
% To maximize a function we simply need to make it negative.
% max f(x) = min -f(x)
[p_max,f_max,exitFlag,output_max]=ga(@neg_equation,nvars,A,b,Aeq,beq,lb,ub);
fprintf('The number of generations was : %d\n', output_max.generations);
fprintf('The Values that optimizize minimum are X={%f} , Y={%f} , Z={%f}\n',p_max(1),p_max(2),p_max(3));
fprintf('The Function Value at Maximum is %f\n',f_max);

