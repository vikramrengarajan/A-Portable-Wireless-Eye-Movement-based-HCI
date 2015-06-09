clc
clear all

%newobjs = instrfind
%fclose(newobjs)


ascii=0;
dly=0.5;
SER_OBJ = serial('COM9','BaudRate',9600);
fopen(SER_OBJ);
x='qp';
warning off;


str=    'ABCDEFGHIJKLMNOPQRSTUVWXYZ-';

ALPHA=str(1);
count=1;

while(ALPHA~='-')        
        %fprintf('\n EVENT Ocuured=%c',fscanf(SER_OBJ,'%c'));        
        move=fscanf(SER_OBJ,'%c');
        
        if(move(1)=='U')
            count=count-1;
        end        
        if(move(1)=='D')
            count=count+1;
        end  
        if(count<=0)
            count=26;
        end        
        if(count>27)
            count=1;
        end;
        
        
        clc        
        fprintf('\nCurrent Alpha=%c',str(count));
        fprintf('\nCurrent Alpha=%s',move);
        ALPHA=str(1);
        
        
%    end
end
    



