    %clear all;
    if ~isempty(instrfind)
        fclose(instrfind);
        delete(instrfind);
    end    
    s1 = serial('COM9');                            %define serial port
    s1.BaudRate=9600; 
    z=[];
    %define baud rate
    %data=zeros(490<)
    %open serial port
    %set(s1, 'terminator', 'LF');
    fopen(s1);
    s1.ReadAsyncMode = 'continuous';
    
%     filename = 'Radar_Range_data.xlxs';
    count =1;
    %data = cell(480,10);
    %evalin('data', 's1');
    readasync(s1);
    while(s1.BytesAvailable <= 0)  %wait until Arduino outputs data 
    end
    for i=1:500
        %while(s1.BytesAvailable > 0)
            data = fscanf(s1); %read sensor
             flushinput(s1);
             disp(data);
             filename  = fopen('radarrange.txt','a')
             fprintf(filename,data);
             fclose(filename);
%              if(data <= 30)
             z= [z; str2num(data)];
            
        
%              pause(1);
            %disp(count)
            %count = count+1;
       % end
    end
     plot(z);
    % close the serial port!
   
    fclose(s1);