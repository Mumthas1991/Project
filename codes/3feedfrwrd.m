
if isempty(obj1)
obj1 = serial('COM68');
else
fclose(obj1);
obj1 = obj1(1)
end
obj1.BaudRate=9600;


fopen(obj1);

range=10;
for i=1:range
    data=fscanf(obj1, '%s')
    
    num = textscan(data, '%d');
 
end

x=[0 1 2 3 4 5 6 7 8];
t=[315 304 299 295 292 285 200 200 205];
net=feedforwardnet(10);
net=configure(net,x,t);
y1=net(x)
plot(x,t,'o',x,y1,'x')
net=train(net,x,t);
y2=net(x)
plot(x,t,'o',x,y1,'x',x,y2,'*')
mean(y2)
std(y2)