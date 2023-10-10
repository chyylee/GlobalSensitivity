%% [dydt, algvars] = ODEfunc(t,y,params)
%
% ODEfunc defines the system of ODEs in the model.

function [dydt, algvars] = ODEfunc(t,y,params)

    % Assign names for parameter values and state variables
    [k1f,k1r,k2f,k2r,Ltot,Rtot] = params{:};
    
    LR = y(1);  % ODE State variable for Ligand:Receptor Complex
    LRp = y(2); % ODE State variable for phosphorylated Ligand:Receptor Complex
    
    % Conservation equations
    L = Ltot - LR - LRp;    % [uM] free ligand concentration
    R = Rtot - LR - LRp;    % [uM] free receptor concentration
    
    % Reaction rates
    react1 = k1f*L*R - k1r*LR;      % [uM/s] L+R<->LR
    react2 = k2f*LR - k2r*LRp;      % [uM/s] LR<->LRp
    % react2 = k2f*LR/(1+LR) - k2r*LRp/(1+LRp);      % [uM/s] LR<->LRp, with Michaelis relationships
    
    % Differential equations;
    dLR = react1-react2;         % [uM/s] ligand-receptor complex
    dLRp = react2;               % [uM/s] ligand-receptor-enzyme complex
    dydt = [dLR;dLRp];           % Reassemble differential equations %make sure to keep in same order as Y
    algvars = [L,R];             % Array to keep track of variables in conservation equations

end