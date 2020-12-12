rng(2,'twister');

 

N=50;

nstep=500000;

printstep=2000;

nprint=floor(nstep/printstep);

nrun=100;

 

t=zeros(nprint,1);

avm=zeros(nprint,1);

ave=zeros(nprint,1);

avm_sqr= zeros(nprint,1);
          
sqr_avm= zeros(nprint,1);
          
theata_m= zeros(nprint,1);

%where we store averages

 

 

 

Jvec=[0.1,0.2,0.3,0.4];

b=0;

pbc=true;

nfig=length(Jvec);

ave_mat = zeros(nprint, nfig);

avm_mat = zeros(nprint, nfig);    %%%%% store data  in matrix for diffenrent value of J

theata_mat = zeros(nprint, nfig);

spins_mat = zeros(N,N, nfig);


 

for JJ=1:nfig
    J= Jvec(JJ);

 spins=zeros(N,N);

for run=1:nrun

   

   m=0;

   for i=1:N

        for j=1:N

            if(rand()<.5)

                spins(i,j)=1;

                m=m+1;

            else

                spins(i,j)=-1;

                m=m-1;

            end

        end

   end

   e=get_init_energy(spins,J,b,N,pbc);

   %initialize the system:  spins and energies computed

  

   for step=1:nstep

      s1=floor(N*rand())+1;

      s2=floor(N*rand())+1;

      enew=e+energy_difference(s1,s2,spins,J,b,N,pbc);

       %try to flip a spin

      if(metropolis(e,enew))

          %use metropolis to accept or reject

         spins(s1,s2)=-spins(s1,s2);

         if(spins(s1,s2)>0)

            m=m+2;

         else

             m=m-2;

         end

         e=enew;

         %update energy and magnetization if accepted

      end

     

      if(mod(step,printstep)==0)

          k=floor(step/printstep);

          t(k)=step;

          avm(k)=avm(k)+abs(m)/N/N;

          ave(k)=ave(k)+e/J/N/N;
          
          avm_sqr(k)= avm(k).^2;   %%%% calcualte <m>^2
          
          sqr_avm(k)= sqr_avm(k)+(m^2)/N/N; %%%%%% calculate <m^2>
          
          theata_m(k)= sqr_avm(k)-avm_sqr(k);   %%%%%%% calculate <m^2>- <m>^2

          %save the averages

      end

   end

end

ave_mat(:,JJ) = ave;

theata_mat(:,JJ) = theata_m;    %%%%%%%%%%%% update and save data into matrix for different J

avm_mat(:,JJ) = avm; 

spins_mat(:,:,JJ) = spins;

end
 



 

% figure(1)
% sgtitle('Spins')
% 
% for j= 1:nfig
% 
% subplot(floor(nfig/2),floor(nfig/2),j)
% 
% title(['J = ',num2str(Jvec(j))])
% 
% disp(spins_mat(:,:,j))
% 
% hold on
% 
% for i=1:N
% 
%     x=find(spins(i,:)==1);
% 
%     y=ones(length(x),1).*i;
% 
%     scatter(x,y,20,'b','filled');
% 
%     pbaspect([1 1 1])
% 
%   
% 
% end
% 
% shg
% 
% if j==nfig
% 
%     hold off
% 
% end
% 
%  
% 
% end
%  
% 
%  
% 
% figure(2)
% sgtitle('Energy')
% for j= 1:nfig
% 
% subplot(floor(nfig/2),floor(nfig/2),j)
% 
% ave = ave_mat(:,j);
% 
% plot(t,ave./nrun)
% 
% title(['J = ',num2str(Jvec(j))])
% 
% xlabel('iteration')
% 
% ylabel('<E>/JN^2')
% end

 

figure(3)

sgtitle('theata_m')
for j= 1:nfig

subplot(floor(nfig/2),floor(nfig/2),j)

fluc =  theata_mat(:,j);

plot(t,fluc./sqrt(nrun))

title(['J = ',num2str(Jvec(j))])

xlabel('iteration')

ylabel('theata_m')

end
 
figure(4)

sgtitle('Magnetization')

 

for j=1:nfig

subplot(floor(nfig/2),floor(nfig/2),j)

avm = avm_mat(:,j);

 

plot(t,avm./nrun)

title(['J = ',num2str(Jvec(j))])

xlabel('iteration')

ylabel('<m>')



 

end
 

%metropolis criterion

function x=metropolis(e,enew)

   if(e>enew)

       x=true;

   else

       if(rand()<exp(-(enew-e)))

           x=true;

       else

           x=false;

       end

   end

end

 

 

 

 

 

%compute the energy of the system

function efinal=get_init_energy(spins,J,b,N,pbc)

    e=0;

    for i=1:(N-1)

       for j=1:(N-1)

          e=e-spins(i,j)*spins(i+1,j);

          e=e-spins(i,j)*spins(i,j+1);

          %bulk contribution, not needing to worry about pbc's

       end

    end

   

 

    for i=1:(N-1)

       e=e-spins(i,N)*spins(i+1,N);

       if(pbc)

            e=e-spins(i,N)*spins(i,1);

       end

    end

    % right side

   

 

    for j=1:(N-1)

        e=e-spins(N,j)*spins(N,j+1);

        if(pbc)

            e=e-spins(N,j)*spins(1,j);

        end

    end

    %bottom

   

 

    if(pbc)

        e=e-spins(N,N)*spins(N,1);

        e=e-spins(N,N)*spins(1,N);

    end

    %bottom right corner

 

    emag=0;

    for i=1:N

        for j=1:N

            emag=emag-spins(i,j);

        end

    end

   

 

   

    e=J*e+b*emag;

    efinal=e;

end

 

 

function de=energy_difference(s1,s2,spins,J,b,N,pbc)

    de=0;

 

   

    evaluate=true;

    t1=s1+1;

    t2=s2;

    if(t1==N+1)

           if(pbc)

               t1=1;

           else

               evaluate=false;

           end

    end

   

    if(evaluate)

           de=de+2*spins(s1,s2)*spins(t1,t2);

    end

          

    evaluate=true;

    t1=s1-1;

    t2=s2;

    if(t1==0)

           if(pbc)

               t1=N;

           else

               evaluate=false;

           end

    end

   

    if(evaluate)

           de=de+2*spins(s1,s2)*spins(t1,t2);      

    end     

    

           

    evaluate=true;

    t1=s1;

    t2=s2+1;

    if(t2==N+1)

           if(pbc)

               t2=1;

           else

               evaluate=false;

           end

    end

   

    if(evaluate)

           de=de+2*spins(s1,s2)*spins(t1,t2);  

    end    

           

           

    evaluate=true;

    t1=s1;

    t2=s2-1;

    if(t2==0)

           if(pbc)

               t2=N;

           else

               evaluate=false;

           end

    end

   

    if(evaluate)

           de=de+2*spins(s1,s2)*spins(t1,t2);

    end

   

    de=de*J;

    if(spins(s1,s2)>0)

        de=de+2*b;

    else

        de=de-2*b;

    end

   

    

end