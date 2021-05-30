function mainfile(op,funcaoativ)
    load('PerfectArial.mat', 'Perfect');
    load('input1000.mat', 'input1000');
    %Cria targets para definir em configure o tamanho dos outputs
    identity = eye(10); %Os testes devem estar sempre na ordem 1 2 3 4 5 6 7 8 9 0 e assim a matriz identidade representa bem os targets para cada input
    targets = repmat(identity, 1, 100);
    if op == 1
        %Números perfeitos
        Perfects = repmat(Perfect, 1, 100);
        weights = Perfects * pinv(input1000);
        P2 = weights * input1000;
        
        if funcaoativ == 1
            nnet = perceptron;
            nnet = configure(nnet,P2, targets);
            W=rand(10,256);
            b=rand(10,1);
            nnet.IW{1,1}=W;
            nnet.b{1,1}=b;
            nnet.performParam.lr = 0.5; % learning rate
            nnet.trainParam.epochs = 10000; % maximum epochs
            nnet.trainParam.show = 35; % show
            nnet.trainParam.goal = 1e-6; % goal=objective
            nnet.performFcn = 'sse'; % criterion
            nnet.divideParam.trainRatio = 85/100; %85porcento para training
            nnet.divideParam.valRatio = 15/100; %15 para validaçao
            
            nnet = train(nnet, P2, targets);
            
            AMhl = nnet;
            save AMhl1000ep10k;
        elseif funcaoativ == 2
            nnet = perceptron;
            nnet = configure(nnet, P2, targets);
            W=rand(10,256);
            b=rand(10,1);
            nnet.IW{1,1}=W;
            nnet.b{1,1}=b;

            nnet.trainParam.epochs = 10000; % maximum epochs
            
            
            nnet.layers{1}.transferFcn = 'purelin';
            nnet.inputWeights{1}.learnFcn = 'learngd'; 
            nnet.biases{1}.learnFcn = 'learngd'; 
            nnet.trainFcn = 'traingd';
            nnet.performFcn = 'sse'; % criterion
            nnet.divideParam.trainRatio = 85/100;
            nnet.divideParam.valRatio = 15/100;
            
            nnet = train(nnet,P2,targets);
            
            AMlin = nnet;
            save AMlin1000ep10k;
            
        elseif funcaoativ==3
            nnet = perceptron;
            nnet = configure(nnet,P2,targets);

            nnet.IW{1,1} = rand(10,256);
            nnet.b{1,1} = rand(10,1);
            nnet.layers{1}.transferFcn = 'logsig';
            nnet.inputWeights{1}.learnFcn = 'learngd';  
            nnet.biases{1}.learnFcn = 'learngd'; 
            nnet.trainFcn = 'traingd';

            nnet.trainParam.epochs = 10000;
            nnet.performFcn = 'sse';

            nnet.divideParam.trainRatio = 85/100;
            nnet.divideParam.valRatio = 15/100;

            nnet=train(nnet,P2,targets);
            AMlog = nnet;
            save AMlog1000ep10k;
        end
    else
        if funcaoativ == 1
            nnet = perceptron;
            nnet = configure(nnet, input1000, targets);

            nnet.IW{1,1} = rand(10,256);
            nnet.b{1,1} = rand(10,1);

            nnet.performParam.lr = 0.5;
            nnet.trainParam.epochs = 10000;
            nnet.trainParam.show =35;


            nnet.performFcn ='sse';
            nnet.divideParam.trainRatio = 85/100;
            nnet.divideParam.valRatio = 15/100;


            nnet=train(nnet,input1000,targets);


            hardlim = nnet;
            save hardlim1000ep10k;
        elseif funcaoativ==2
            nnet = perceptron;
            nnet = configure(nnet,input1000,targets);

            nnet.IW{1,1} = rand(10,256);
            nnet.b{1,1} = rand(10,1);

            nnet.layers{1}.transferFcn = 'purelin';
            nnet.inputWeights{1}.learnFcn = 'learngd';  
            nnet.biases{1}.learnFcn = 'learngd'; 
            nnet.trainFcn = 'traingd';


            nnet.trainParam.epochs = 10000;
            nnet.performFcn = 'sse';
            nnet.divideParam.trainRatio = 85/100;
            nnet.divideParam.valRatio = 15/100;

            nnet = train(nnet,input1000,targets);

            linear = nnet;
            save linear1000ep10k;
        elseif funcaoativ == 3
            nnet = perceptron;
            nnet = configure(nnet,input1000,targets);

            nnet.IW{1,1} = rand(10,256);
            nnet.b{1,1} = rand(10,1);

            nnet.layers{1}.transferFcn = 'logsig';
            nnet.inputWeights{1}.learnFcn = 'learngd'; 
            nnet.biases{1}.learnFcn = 'learngd'; 
            nnet.trainFcn = 'traingd';


            nnet.trainParam.epochs = 10000;
            nnet.performFcn = 'sse';

            nnet.divideParam.trainRatio = 85/100;
            nnet.divideParam.valRatio = 15/100;

            nnet=train(nnet,input1000,targets);
            logsig = nnet;
            save logsig1000ep10k;
        end
    
    end
            
            
        
        
        
end

