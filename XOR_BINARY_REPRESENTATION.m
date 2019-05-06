%% Back propagation net for the Xor function: binary representation
% Training using binary input is relatively slow; any unit that receives an
% input of zero for a particilar pattern cannot learn that pattern. for the
% binary case, training took at most 3,000 epocs. 

%% initial some situation.
% clear variables and command window
clear;
clc;

% call Matrices_Xor_binary.m script
Matrices_Xor_binary;

% define learning rate
alpha  = 0.2;

% define plt and l variable for plot error in the learning 
plt = [1,2];
l=0;

% feedforward algorithm for hidden and output layer

% hidden layer data calculation
% epoc counter
epoc = 0;

% define W_ij_old for calculating Square Error
w_ij_old = zeros(size(w_ij));

% output is used to stor output neuron unit
output = zeros(1,4);

% square error;
SE = 1;

%% training section 
% The while loop is used to check square errors of output minus input
% pattern, until the square error get less than 0.05.
while SE ~= 0
    w_ij_old = w_ij;
    epoc = epoc + 1;
    
    % calculate hidden and output layer for all 4 inputed sample
    for sample = 1:4
        
        % calculate hidden layer neurons weights and its output
        z_in = v_ij' * x(: , sample);
        z = sigmf(z_in,[1 0]);

        % calculate output layer neuron weights and its output        
        y_in = w_ij' * z;
        y = sigmf(y_in,[1 0]);

        output(sample) = y;
 
        % Compute Errors on hidden to output layers as Delta,
        % also compute Error on input to hidden layers as Mu.
        delta = (target(sample) - y) .* ...
            (sigmf(y_in,[1 0]) * (1- sigmf(y_in,[1 0])));
        mu = (delta * w_ij) .* ...
            (sigmf(z_in,[1 0]) .* (1- sigmf(z_in,[1 0])));

        % Update weights on both input to hidden layer and hidden to output
        % layer
        w_ij = w_ij + alpha * z * delta;
        w_ij_0 = w_ij_0 + alpha * delta;
        v_ij = v_ij + alpha * x(:, sample) * mu';

    end
    
   % Calculate square error
    SE = sum((output - target).^2);
    % if square error will become less than 0.05, then square error will be
    % supposed to convergence.
    SE(SE < 0.05) = 0;
    
    % After each 50 epocs both epoc number and square error store to plt
    % variable to plot it after it finish training 
    if (mod(epoc,50) == 0)
        l = l + 1;
        plt(l,1:2) = [epoc,SE];
    end
end

%% Plot section
% plot Error in total Square
pause(.1);
hold on
p = plot(plt(:,1),plt(:,2),'-o');
title('Error on binary sigmoid activation function')
xlabel('Epoc number')
ylabel('Error')
legend('Error Line');
p.LineWidth = 1;


