
%HÜSEYÝN HÜRKAN KARAMAN 1030516163 1.Öðretim A grubu
%SEMÝH CAN BOZOK 1030516177 1.Öðretim A Grubu
%TIMAN AHMAT DJEROU 1030516145 1.Öðretim A Grubu
function [m,error] = neural2()
% DATA SETS;
[Attributes, Classifications] = Untitled6;%Dataset for train
[AttributesTest, ClassificationsTest] = Untitled7;%Dataset for test

n = 2.6;
nbrOfNodes = 10;
nbrOfEpochs = 50;

% Initialize matrices with random weights 0-1
W = rand(nbrOfNodes, length(Attributes(1,:)));
U = rand(length(Classifications(1,:)),nbrOfNodes);

m = 0; figure; hold on; e = size(Attributes);

while m < nbrOfEpochs

    % Increment loop counter
    m = m + 1;

    % Iterate through all examples
    for i=1:e(1)
        % Input data from current example set
        I = Attributes(i,:).';
        D = Classifications(i,:).';

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
    g = size(AttributesTest);
    % RMS Hata Oraný Hesaplamasý
    for i=1:g(1)
        D = ClassificationsTest(i,:).';
        I = AttributesTest(i,:).';
        RMS_Err = RMS_Err + norm(D-f(U*f(W*I)),2);
    end
    error = RMS_Err;
    y = RMS_Err/g(1);
    plot(m,log(y),'*');    
end



%Basit bir fonksiyon.
function x = f(x)
x = 1./(1+exp(-x));