%pegah shabani
%initioalization
%init(:,3)=age
%init(:,4)=fittness

init=zeros(500,12);
candidate=zeros(100,12);

%mp=zeros(100,3);
init(1:100, 1)=(pi*rand(100,1));
init(1:100, 2)= pi*rand(100,1);
init(1:100, 3)=(pi*rand(100,1));
init(1:100, 4)= pi*rand(100,1);
init(1:100, 5)=(pi*rand(100,1));
init(1:100, 6)=(pi*rand(100,1));
init(1:100, 7)= pi*rand(100,1);
init(1:100, 8)=(pi*rand(100,1));
init(1:100, 9)= pi*rand(100,1);
init(1:100, 10)=(pi*rand(100,1));


lifetime=10;
LSC=9;
GSC=9;
theta=0.2;
theza=2;
transrate=0.1;%nrkh jamiati k az candidate be jamiat asli bazgardandeh mishvd
for u=1:10
  population=zeros(400,12);
  can=zeros(400,12);
    x1= init(:,1)~=0;
    x2= init(:,2)~=0;
    x3= init(:,3)~=0;
    x4=init(:,4)~=0;
    x5= init(:,5)~=0;
    x6= init(:,1)~=0;
    x7= init(:,2)~=0;
    x8= init(:,3)~=0;
    x9=init(:,4)~=0;
    x10= init(:,5)~=0;
    
    x=x1|x2|x3|x4|x5|x6|x7|x8|x9|x10;
    x1=sum(x);
  
  %x1bayd 100 bashd tedad derhtane mojud dr jangal 100 ast 
    
    m=0;

    for z=1:x1
        %for i=1:LSC
           n=m+1;
           m=m+2;
           i=[1;1]*init(z,1:10);
           population(n:m,1:10)=i;
           y=size(init,2)-2;%fittness va age;
           j=round(1+(y-1)*rand);
           d=round(1+(y-1)*rand);
           population(n,j)=init(z,j)+theta;
           population(n+1,d)=init(z,d)+theta;
           if population(n,:)==population(n+1,:)
               population(n+1,:)=[];
               m=m-1;
           end

        %end
    end
    %afzayesh sene derkhtan
    init(:,11)=init(:,11)+1;
    
    q=0;
     f=size(population,1);
     %serfan hazf sefr ha az matrix population agar tedad farzandan dar localseeding kamtar az 4 bud 
    for mm=1:f
          if population(mm-q,:)==zeros(1,12)
              population(mm-q,:)=[];
              q=q+1;
          end
    end
        %farzandan tolid shode dar local seeding ra  be jangal ezafe
        %mikonim
       f=size(population,1);
       g=(x1)+1;
       b=g+f;
       b=b-1;     
       init(g:b,1:12)=population(1:f,1:12);
       %mohasebe meghdar fittness baraye hame terakhtan 
       for h=1:b
          init(h,12)=-michal(init(h,1:10));
       end
       %hazf derakhtan pir
    p=0;
    for nn=1:b
        r=1;
          if init(nn-p,6)==10
              candidate(r,:)=init(nn-p,:);
              init(nn-p,:)=[];
              p=p+1;
              r=r+1;
          end
    end
        %arealimitation
     
        init=sortrows(init,12);
        init = flipud(init);
        candidate=init(91:end,:);
        init(91:end,:)=0;
        %aa=0;
        r=size(candidate,1)+1;
       % b=b+1;
    
        %global seeding 
      candidate=sortrows(candidate,12);
      candidate = flipud(candidate);
      k=size(candidate,1);
      k=k*transrate;
    for ee=1:k
        for uu=1:GSC;
           n=(ee-1)+uu;
           population(n,1:10)=candidate(ee,1:10);
           y=size(candidate,2)-2;%fittness va age;
           mm=round(1+(y-1)*rand);
           population(n,mm)=candidate(ee,mm)+theza;
        end
        
    end
     for h=1:k
          population(h,12)=-(michal(population(h,1:10)));
       
     end    
     population (:,11)=0;
     init(91:100,1:12)=population(1:10,1:12);
     init=sortrows(init,12);
     init = flipud(init);
     init(1,11)=0;
     init(1,:)
end
    