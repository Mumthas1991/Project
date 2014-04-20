% Modify these two lines to reflect
% your account and password.
myaddress = '@gmail.com';
mypassword = 'password';

setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username','username@gmail.com');
setpref('Internet','SMTP_Password','passwrd');

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(myaddress, 'Gmail Test', 'you are vulnerable.');