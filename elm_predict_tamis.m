function [output] = elm_predict(Data)

% Usage: elm_predict(TestingData_File)
% OR:    [TestingTime, TestingAccuracy] = elm_predict(TestingData_File)
%
% Input:
% TestingData_File      - Filename of testing data set
%
% Output: 
% TestingTime           - Time (seconds) spent on predicting ALL testing data
% TestingAccuracy       - Testing accuracy: 
%                           RMSE for regression or correct classification rate for classification
%
% MULTI-CLASSE CLASSIFICATION: NUMBER OF OUTPUT NEURONS WILL BE AUTOMATICALLY SET EQUAL TO NUMBER OF CLASSES
% FOR EXAMPLE, if there are 7 classes in all, there will have 7 output
% neurons; neuron 5 has the highest output means input belongs to 5-th class
%
% Sample1 regression: [TestingTime, TestingAccuracy] = elm_predict('sinc_test')
% Sample2 classification: elm_predict('diabetes_test')
%
    %%%%    Authors:    MR QIN-YU ZHU AND DR GUANG-BIN HUANG
    %%%%    NANYANG TECHNOLOGICAL UNIVERSITY, SINGAPORE
    %%%%    EMAIL:      EGBHUANG@NTU.EDU.SG; GBHUANG@IEEE.ORG
    %%%%    WEBSITE:    http://www.ntu.edu.sg/eee/icis/cv/egbhuang.htm
    %%%%    DATE:       APRIL 2004

%%%%%%%%%%% Macro definition
REGRESSION=0;
CLASSIFIER=1;

%%%%%%%%%%% Load testing dataset

TV.P=Data';

NumberofTestingData=size(TV.P,2);

load elm_model.mat;
                                         %   end if of Elm_Type

%%%%%%%%%%% Calculate the output of testing input
start_time_test=cputime;
tempH_test=InputWeight*TV.P;
clear TV.P;             %   Release input of testing data             
ind=ones(1,NumberofTestingData);
BiasMatrix=BiasofHiddenNeurons(:,ind);              %   Extend the bias matrix BiasofHiddenNeurons to match the demention of H
tempH_test=tempH_test + BiasMatrix;
switch lower(ActivationFunction)
    case {'sig','sigmoid'}
        %%%%%%%% Sigmoid 
        H_test = 1 ./ (1 + exp(-tempH_test));
    case {'sin','sine'}
        %%%%%%%% Sine
        H_test = sin(tempH_test);        
    case {'hardlim'}
        %%%%%%%% Hard Limit
        H_test = hardlim(tempH_test);        
        %%%%%%%% More activation functions can be added here        
end
TY=(H_test' * OutputWeight)';                       %   TY: the actual output of the testing data
end_time_test=cputime;
TestingTime=end_time_test-start_time_test           %   Calculate CPU time (seconds) spent by ELM predicting the whole testing data

output = TY;