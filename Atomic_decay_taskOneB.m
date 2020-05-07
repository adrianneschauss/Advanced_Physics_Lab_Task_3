%half life of atoms N(t)= N0*2^(-t/t_0.5)
%probability of one atom decaying at any time is p(t)=1-2(-t/t_0.5)

%variables 
atoms = 5000
%number of atoms we will iterate for 

halflife = 500 
%half life time of atoms
tsteps = 1000
%time steps we will iterate for
a= 0
b=1 
%probability range 

decayedatoms = 0; 
%number of decayed atoms at t0
leftatoms= 7000;
%number of atoms at t0 




decayed = zeros(1,tsteps);

for t = 2:tsteps    
    for i=1:atoms
        p = (b-a).*rand(1,1)+a;
        %produce a random probability 
     
        if  p > 1-(2.^(-t/t_halflife))
            %condition if the probability of 
            atoms = atoms - 1;
            %one unit of atoms from atoms at iteration before decays 
            decayedatoms = decayedatoms + 1;
            %number of decayed atoms increases by one unit 
        end 
    end  
    decayed(t) = atoms;
end 

plot(1:tsteps, decayed)
ylabel('Number of decayed atoms');
xlabel('time')
title('Atomic decay over time');
