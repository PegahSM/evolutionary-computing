%mygenetic
%initialization
popsize=100;
%2Simentional test function
init=zeros(100,6);
mp=zeros(100,3);
init(:, 1)=(-15)+(10*rand(100,1));
init(:, 2)=-3+6*rand(100,1);
Pm=0.3;
Pc=0.8;
MG=10000;
conter=0;
population=zeros(300,3);
polution=zeros(300,3);

for h=1:popsize
     init(h,3)=200-bukin6(init(h,1:2));
end   
for i=2:MG
%while 200-init(1,3)>0.5
    %conter=conter+1;
    %t=rouletwheel(init);
    %adade random tolid mikonim ta ehtemal entekhab baraye crossover
    %entekhab moshakhas shavad 
    %selection 1 barae crossover 
    %init(:,4)=rand(100,1);  
        
    %x= init(:,4)<Pc;
    %x1=sum(x);

   %if mod(x1,2)==0
       %barae entkhab parent az nasl feli
       %va hazf satr haye 0 
       %mp=init(:,1:3).*[x,x,x];
       p=0;
       
       for nn=1:popsize
          if mp(nn-p,:)==zeros(1,3)
              mp(nn-p,:)=[];
              p=p+1;
          end
       end
        s=x1/2;
        s2=s+1;
        m1=mp(1:s,1:3);
        m2=mp(s2:end,:);
        w1=round(0.5+(s*rand));
        d=s-w1;
        bitween=m2(1:w1,:);
        m2(1:d+1,:)= m2(w1:end,:);
        m2(d+1:end,:)=bitween;
        cpint=round(1+rand);
        cmid=zeros(x1,3);
        %baraye ink joft kardan parent haye enteekhabi tasadofi bashd 
        %parent ha ra 2 ghesmate mosavi taghsim krde va dr ghesmt dovom 
        %yek noghte tasadofi entekhab mikonim va azaye matrix 2vom ra nesbat be
        %in noghte jabeja mikonim
        cmid(1:s,1:cpint)=m1(:,1:cpint);
        v=s+1;
        cmid(v:end,1:cpint)=m2(:,1:cpint);
        cmid(1:s,cpint+1:end)=m2(:,cpint+1:end);
        cmid(v:end,cpint:end)=m1(:,cpint:end);
        c2mid(1:x1,1:2)=cmid(:,1:2);
        for z=1:x1
            c2mid(z,3)=200-bukin6(cmid(z,1:2));
        end
        %mutation
        init(:,5)=rand(100,1);
        x2= init(:,5)<Pm;
        x3=sum(x2);
        mu=init(:,1:3).*[x2 x2 x2];
        e=0;
        for nm=1:popsize
           
          if mu(nm-e,:)==zeros(1,3)
              mu(nm-e,:)=[];
              e=e+1;
          end
        end
      
        mpoint=round(1+rand);
        if mpint==1
            mu(:, 1)=(-15)+(10*rand(x3,1));
        else if mpint==2
                mu(:, 2)=-3+6*rand(x3,1);
            end
        end
        for y=1:x3
             mu(y,3)=200-bukin6(mu(y,1:2));
        end
        
 t=popsize+(x1);
 o=popsize+(x1)+1;
 u=popsize+(x1)+(x3);
 y=(x1)+1;
%population=[c2mid init(:,1:3)];
 population(1:x1,:)=c2mid(1:x1,:);
 population(y:t,:)=init(1:100,1:3);
 population(o:u,:)=mu(1:x3,1:3);
 
 %select function 1
%select bests baraye nasl bad behtrin ha az nazar meghdar fittness ra
%entekhab mikonim
 ki=population(:,3)*10000;
 polution(:,1:2)=population(:,1:2);
 polution(:,3)=ki;
 polution=sortrows(polution,3);
 init(:,1:2)=polution(300:-1:201,1:2);
 init(1:100,3)=polution(end:-1:201,3)/10000;
 %init(:,1:3)=populat(1:popsize,:);
  t=rolletwheel(init);
end
 best=init(1,:);
percent=best(1,3)/200


    
