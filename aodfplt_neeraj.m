clc;
clear;
aod=dlmread('AODF.001');
n1=size(aod);
z=1
for i=1:n1(1);
    for j=1:n1(2);
    aod1(z)=aod(i,j);
    z=z+1;
    end;
end;
aod2=aod1';
n2=size(aod2);
z=1;
for i=1:n2(1)
    if(aod2(i)~=0.0)
        aod3(z)=aod2(i);
        z=z+1;
    end
end
aod4=aod3';

ang1=[0:5:90]';
phi1=[ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;...
      ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1;ang1];
  
  ang2=zeros(19,1);
 phi2=[ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90;...
     ang2;ang2+5;ang2+10;ang2+15;ang2+20;ang2+25;ang2+30;ang2+35;ang2+40;ang2+45;ang2+50;ang2+55;ang2+60;ang2+65;ang2+70;ang2+75;ang2+80;ang2+85;ang2+90];
     
    ang3=zeros(361,1);
    phi=[ang3;ang3+5;ang3+10;ang3+15;ang3+20;ang3+25;ang3+30;ang3+35;ang3+40;ang3+45;ang3+50;ang3+55;ang3+60;ang3+65;ang3+70;ang3+75;ang3+80;ang3+85;ang3+90];
 
 totmatorg=[phi1 phi2 phi aod4];
 totmat=[phi1 phi phi2 aod4];
 


alphain=[0      45      0;5      45      0;10      45      0;15      45      0;20      45      0;...
25      45      0;30      45      0;35      45      0;40      45      0;45      45      0;50      45      0;...
55      45      0;60      45      0;65      45      0;70      45      0;75      45      0;80      45      0;...
85      45      0;90      45      0];
n3=size(totmat);
n4=size(alphain);

for m=1:n4(1)
for i=1:n3(1)   
    if((totmat(i,1)==alphain(m,1))&&(totmat(i,2)==alphain(m,2))&&(totmat(i,3)==alphain(m,3)))  
        alphval(m)=totmat(i,4)  ;      
    end
end
end

alpplot=[alphain(:,1) alphval'];

figure (1)

axes('FontSize',14)
plot(alpplot(:,1),alpplot(:,2),'-bs','Linewidth',2)
grid on
title('Alpha (fcc rolling)')

xlabel('Phi1 (degrees)')
ylabel('SOD intensity [m.r.d]')

 
 
 tauin=[0      0      45;5      0      45;10      0      45;15      0      45;20      0      45;25      0      45;...
30      0      45;35      0      45;40      0      45;45      0      45;50      0      45;55      0      45;...
60      0      45;65      0      45;70      0      45;75      0      45;80      0      45;85      0      45;90      0      45];


n3=size(totmat);
n4=size(tauin);

for m=1:n4(1)
for i=1:n3(1)   
    if((totmat(i,1)==tauin(m,1))&&(totmat(i,2)==tauin(m,2))&&(totmat(i,3)==tauin(m,3)))  
        tauval(m)=totmat(i,4) ; 
                        
    end
end
end

tauplot=[tauin(:,1) tauval'];

figure (2)
axes('FontSize',14)

plot(tauplot(:,1),tauplot(:,2),'-ro','Linewidth',2)

grid on
title('Tau (fcc rolling)')

xlabel('Phi1 (degrees)')
ylabel('SOD intensity [m.r.d]')


 betain=[90	35.3	45;81.5	35.7	50;73.1	36.1	55;64.6	36.4	60;57.5	37.2	65;...
53	38.3	70;48.6	40.3	75;44.2	41.9	80;39.7	43.4	85;35.3	45	90];

y1=[35;40];

n3=size(totmat);

for i=1:n3(1)   
    if((totmat(i,1)==90.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==45.0))  
        val1=totmat(i,4) ;                        
    end
    if((totmat(i,1)==90.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==45.0))  
        val2=totmat(i,4) ;                        
    end
end

val=[val1;val2];

betaval(1)=interp1(y1,val,35.3);

x2=[80;85];
y2=[35;40];
 
 n3=size(totmat);

for i=1:n3(1)   
    if((totmat(i,1)==80.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==50.0))  
        val3=totmat(i,4) ;                        
    end
    
    if((totmat(i,1)==85.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==50.0))  
        val4=totmat(i,4) ;                        
    end
    
      if((totmat(i,1)==80.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==50.0))  
        val5=totmat(i,4) ;                        
      end
    

    
    
    if((totmat(i,1)==85.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==50.0))  
        val6=totmat(i,4) ;                        
    end
end

val7=[val3 val4;val5 val6];
[x3 y3]=meshgrid(x2,y2);

betaval(2)=interp2(x3,y3,val7,81.5,35.7);



x4=[70;75];
y4=[35;40];

 n3=size(totmat);

for i=1:n3(1)   
    if((totmat(i,1)==70.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==55.0))  
        val8=totmat(i,4) ;                        
    end
    
    if((totmat(i,1)==75.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==55.0))  
        val9=totmat(i,4) ;                        
    end
    
      if((totmat(i,1)==70.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==55.0))  
        val10=totmat(i,4) ;                        
      end
       
    
    if((totmat(i,1)==75.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==55.0))  
        val11=totmat(i,4) ;                        
    end
end

val12=[val8 val9;val10 val11];
[x5 y5]=meshgrid(x4,y4);

betaval(3)=interp2(x5,y5,val12,73.1,36.1);

x6=[60;65];
y6=[35;40];

 n3=size(totmat);

for i=1:n3(1)   
    if((totmat(i,1)==60.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==60.0))  
        val14=totmat(i,4) ;                        
    end
    
    if((totmat(i,1)==65.0)&&(totmat(i,2)==35.0)&&(totmat(i,3)==60.0))  
        val15=totmat(i,4) ;                        
    end
    
      if((totmat(i,1)==60.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==60.0))  
        val16=totmat(i,4) ;                        
      end
       
    
    if((totmat(i,1)==65.0)&&(totmat(i,2)==40.0)&&(totmat(i,3)==60.0))  
        val17=totmat(i,4) ;                        
    end
end

val18=[val14 val15;val16 val17];
[x7 y7]=meshgrid(x6,y6);

betaval(4)=interp2(x7,y7,val18,64.6,36.4);

figure (3)

subplot(2,1,2);

plot(betain(:,3),betain(:,2),'-bo')
hold on
plot(betain(:,3),betain(:,1),'-rs')
legend('Phi2 vs Phi','Phi2 vs Phi1')
xlabel('Phi2 (position along beta fiber in degrees)')
ylabel('Phi1 and Phi[degrees]')
grid on

subplot(2,1,1); plot(betain((1:4),3),betaval(1:4),'-bo')
ylabel('SOD intensity [m.r.d]')
axis([45.0 90.0 0.0 2.0])
grid on

