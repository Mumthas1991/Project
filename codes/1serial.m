
%----------------Read in serial data-------------------------------------%

if isempty(obj1)
obj1 = serial('COM68');
else
fclose(obj1);
obj1 = obj1(1)
end
obj1.BaudRate=9600;


fopen(obj1);

range=25;
for i=1:range
    data=fscanf(obj1, '%s')
    
    num = textscan(data, '%d');
 
end


