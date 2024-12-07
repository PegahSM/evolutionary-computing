%selection roletwheel
function [y] = rouletwheel(init)
s=size(init,1);
%choosen=zero(s,:);
init(:,4)=init(:,3)./200;
   init(:,4)>.9997;
   finit=init.*[x,x,x,x,x,x];
        c=sum(x);
 %init(:,6)=4;

     for nn=1:c
         p=0;
          if finit(nn-p,:)==zeros(1,6)
             finit(nn-p,:)=[];
              p=p+1;
          end
     end
     %c=sum(x);
     %v=size(finit,1);
     for i=1:c
         j=(4*(i-1))+1;
         
         people(j:4*i,:)=finit(i,:);
          people(:,6)=4;
          
     end 
     

      
   
%elseif init(:,4)>.9995
 %   init (:,6)=3;
 %   elseif init(:,4)>.9990
  %          init (:,6)=2;
%else 
 %    y=   init (:,6)=1;
%end


            
