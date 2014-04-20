x=[0 1 2 3 4 5 6 7 8];
t=[315 304 299 295 292 285 200 200 205];
net=feedforwardnet(10);
net=configure(net,x,t);
y1=net(x)
plot(x,t,'o',x,y1,'x')
net=train(net,x,t);
y2=net(x)
plot(x,t,'o',x,y1,'x',x,y2,'*')


% **CLOSE PLOT TO END SESSION
 
clear
clc
 
%User Defined Properties
serialPort = 'COM68';            % define COM port #
plotTitle = 'Serial Data Log';  % plot title
xLabel = 'Elapsed Time (s)';    % x-axis label
yLabel = 'Data';                % y-axis label
plotGrid = 'off';                % 'off' to turn off grid
min = -1;                     % set y-min
max = 500;                      % set y-max
scrollWidth = 10;               % display period in plot, plot entire data log if <= 0
delay = .01;                    % make sure sample faster than resolution
 
%Define Function Variables
time = 0;
data = 0;
count = 0;
 
%Set up Plot
plotGraph = plot(time,data,'-mo',...
                'LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',2);
             
title(plotTitle,'FontSize',25);
xlabel(xLabel,'FontSize',15);
ylabel(yLabel,'FontSize',15);
axis([0 10 min max]);
grid(plotGrid);
 
%Open Serial COM Port
s = serial(serialPort)
disp('Close Plot to End Session');
fopen(s);
 
tic
 
while ishandle(plotGraph) %Loop when Plot is Active
     
    dat = fscanf(s,'%d'); %Read Data from Serial as Float
    
     %Make sure Data Type is Correct       
        count = count + 1;   
        time(count) = toc;    %Extract Elapsed Time
        data(count) = dat(1); %Extract 1st Data Element        
         
        %Set Axis according to Scroll Width
        if(scrollWidth > 0)
        set(plotGraph,'XData',time(time > time(count)-scrollWidth),'YData',data(time > time(count)-scrollWidth));
        axis([time(count)-scrollWidth time(count) min max]);
        else
        set(plotGraph,'XData',time,'YData',data);
        axis([0 time(count) min max]);
        end
   
        %Allow MATLAB to Update Plot
        pause(delay);
    
end

%Close Serial COM Port and Delete useless Variables
%fclose(s);

m1 = mean(y2)
s1 = std(y2)

m2 = mean(data)
s2 = std(data)
%clear count dat delay max min plotGraph plotGrid plotTitle s ...
       % scrollWidth serialPort xLabel yLabel; 
    
if (m1-m2 < 10 && s1-s2 < 10)
     % Modify these two lines to reflect
% your account and password.
myaddress = '@gmail.com';
mypassword = 'passwrd';

setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username','@gmail.com');
setpref('Internet','SMTP_Password','passwrd');

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(myaddress, 'Gmail Test', 'you are vulnerable.');
end;
 
disp('Session Terminated...');
