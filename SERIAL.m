J=1; 				%EXPECTED NUMBER OF BYTES
a=cell(1890000,1);
a=cell(1890000,1);
s1=serial('com9');
s1.inputbuffersize =630784;
s1.inputbuffersize =1890000;
set(s1,'BaudRate',9600,'timeout',10);
% filename = 'Radarrangedata.xlsx'; 
fopen(s1);
m=0;
%prompt = 'Enter the empty thank height value in meter? ';
%h = input(prompt);
fid2=fopen('RLP3.txt','at+'); %... ***

for i=1:270000 

a{i}=fread(s1,J,'uint8');
% a{i}(3)=a{i}(2)+a{i}(1);                               
%Level =  a{i}(3,1);
disp(a{i});

end
fclose(fid);   %..............&&&&&

fclose(fid2);
fclose(s1);