function classification = myclassify(data,n)

    opcao = input('[Arquitetura]:\n 1- AM + Hardlim\n 2- AM + Purelin\n 3- AM + Logsig\n 4- Hardlim\n 5- Purelin\n 6- Logsig\n'); 
    
    if opcao == 1
        load('AMhl1000.mat');
    elseif opcao == 2
        load('AMlin1000.mat');
    elseif opcao == 3
        load('AMlog1000.mat');
    elseif opcao == 4 
        load('hardlim1000.mat');
    elseif opcao == 5
        load('linear1000.mat');
    elseif opcao == 6
        load('logsig1000.mat');
    end
    
    [x,y] = max(nnet(data));
    
    classification = y(n);
    
end

