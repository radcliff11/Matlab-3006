clear all; close all; clc;
%Define Signal length
Num_Bit = 1024;
%Define signal power                   
Signal_Power = 1; 
%SNR_dB = 10 log (Signal_Power/Noise_Power)                 
SNR_dB = 0:1:20;
%==> SNR = Signal_Power/Noise_Power = 10^(SNR_dB/10)
SNR = (10.^(SNR_dB/10));

% Set run times
Total_Run = 20;
%Different SNR value
for i = 1 : length(SNR)
	%Avg_Error = 0;
    %Error_Rate=zeros(1,Total_Run);
    result=zeros(1,Total_Run);
    Receive=zeros(1,Total_Run);
    threshold=0;
    
	for j = 1 : Total_Run
		%Input singal
		%Generate random binary digit(0 or 1)
		Data = round(rand(1,Num_Bit));
		%Convert binary digit to (-1 or +1)
		Signal = 2 .* Data - 1;
		%Generate Noise  		
		Noise_Power = Signal_Power ./SNR(i);
		Noise = sqrt(Noise_Power/2) .*randn(1,Num_Bit);   
		%Received Signal 
		Receive = Signal+Noise; 

		Threshold = 0;
		Error = 0; 
		%for k= 1 : Num_Bit
            
		%	if (Receive(k)>= Threshold) && Data(k)==0||(Receive(k)<Threshold && Data(k)==1)
		%		Error = Error+1;
		%	end
		%end
		%Calculate bit error rate
		%Error = Error ./Num_Bit;  
		%Calculate the average error for every runtime		
		%Avg_Error = Error + Avg_Error;   
        
	end
	%Error_Rate(i) = Avg_Error / Total_Run;
    for k=1: Total_Run
        result=zeros(1,Num_Bit);
        for n= 1: Num_Bit
            if(Receive(n)>threshold)
                result(n)=1;
            else
                result(n)=0;
            end
        end
    end
        %result(k) = HammingEncodingThreshold(Num_Bit, threshold, Receive);
    
    EncodeHamming= encode(result,7,4,'hamming/fmt');
    
end