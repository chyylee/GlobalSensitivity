%% g = Sobol_ODEfunc(x,tspan,y0,options,yout_idx)
%
% File to run GSAT on an ODE model (used in Run_Sobol_Method_GSAT.m)
%   x: parameter values
%   tspan: tspan of ODE simulation
%   y0: initial conditions of the ODE simulation
%   options: ODE solver options
%   yout_idx: index of dydt (ODE) to use as response variable
%
%   g: output of model to assess sensitivity metrics for

function g = Sobol_ODEfunc(x,tspan,y0,options,yout_idx)
    
    params = num2cell(x); % model parameters
    [~,y] = ode15s(@ODEfunc,tspan,y0,options,params); % call ODE file
    g = y(end,yout_idx); % output

end