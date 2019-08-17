%% Very simple and intuitive neural network implementation
%
%  Carl Löndahl, 2008
%  email: carl(dot)londahl(at)gmail(dot)com
%  Feel free to redistribute and/or to modify in any way

function m = neural()
% DATA SETS; demo file

[test_class,test_data,train_class,train_data] = Untitled5();


n = 2.6;
nbrOfNodes = 5;
nbrOfEpochs = 50;

% Initialize matrices with random weights 0-1
W = rand(nbrOfNodes, length(train_data(1,:)));
U = rand(length(train_class(1,:)),nbrOfNodes);

m = 0; figure; hold on; e = size(train_data);

while m < nbrOfEpochs

    % Increment loop counter
    m = m + 1;

    % Iterate through all examples
    for i=1:e(1)
        % Input data from current example set
        I = train_data(i,:).';
        D = train_class(i,:).';
        size(I);
        size(W);
        % Propagate the signals through network
        
        H = f(W*I);
        O = f(U*H);

        % Output layer error
        delta_i = O.*(1-O).*(D-O);

        % Calculate error for each node in layer_(n-1)
        delta_j = H.*(1-H).*(U.'*delta_i);

        % Adjust weights in matrices sequentially
        U = U + n.*delta_i*(H.');
        W = W + n.*delta_j*(I.');
    end

    RMS_Err = 0;

    % Calculate RMS error
    for i=1:e(1)
        D = train_class(i,:).';
        I = train_data(i,:).';
        RMS_Err = RMS_Err + norm(D-f(U*f(W*I)),2);
    end
    
    y = RMS_Err/e(1);
    plot(m,log(y),'*');

end


function x = f(x)
x = 1./(1+exp(-x));