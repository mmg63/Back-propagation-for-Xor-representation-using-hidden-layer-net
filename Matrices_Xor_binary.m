%% Matrices definitions and initial its weights

% Define total of samples for the training
num_of_samples = 4;

% Define target as we expected to learn with our network
target = [0,1,1,0];

% Each sample represented in one column
% All input samples and it weights is represented in columns way
x = [1,1,1,1; % biases
     0,0,1,1; 
     0,1,0,1];

%  Weights from input layer to hidden layer. it is known as V_ij
v_ij = [-0.3378, 0.2771, 0.2859, -0.3329; % biases weight
        0.1970, 0.3191, -0.1448, 0.3594;  % weight from the first input unit
        0.3099, 0.1904, -0.0347, -0.4861  % weight from the second input unit
       ];

% the initial weight from the input hidden layer to the output layer. it is
% shown as W_ij
w_ij = [ 0.4914; -0.2913; -0.3979; 0.3581];
w_ij_0 = -0.1401;  



