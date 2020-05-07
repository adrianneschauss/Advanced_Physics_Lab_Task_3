%Forecast of weather simulation 



states = {'sunny', 'rainy'};
% possible staes the weather can be in, defined here
transition_names= {'susu','sura';'rara','rasu'};
%from one discrete iteration to the next there are transtiotions from
%example sunny to rainy etc.
tm = [0.9, 0.1; 0.5,0.5];
%matrix that determines the probabilities of the transitions listed above

days= 14;
%total days of which forecast is being made 
sims= 5;
%number of simulations of 14-day forecasts 

obs= zeros(1,days);
% preallocate the output array for observations 
obs(1) = 1
%start with a observation of either sunny or rainy (labelled 1 and 2
%respectively for simplicity 


matrix_counts =zeros(sims,2);   
% preallocate the output array for counts 
irow=0; 
%row counter 
       
for i=1:sims 
    %iterate for a certain number of simulations 
      for t=2:days
          %iterate for a number of days 
 distribution = tm(obs(t-1),:)
 %use transition matrix to find the next observation 
 cumulativedistribution= cumsum(distribution)
 r=rand()
 obs(t) = find(cumulativedistribution>r,1)
%construct 1X14 vector containing the observations over the days  

 binc = [1:2];
%define integer bin values
 counts = hist(obs,binc)
%count frequency of 1 and 2 (sunny and rainy) in observations
       end 

  irow=irow+1;            
  % increment counter
  matrix_counts(irow,:) = counts
  %forms a matrix with all the frequencies per 14-days 
end
    

figure (1)

h = bar(matrix_counts,'stacked')
labels = {'Rainy','Sunny'};
[~, h2] = legend(fliplr(labels),'Location','NorthWest');
xlabel('Number of Simulations')
ylabel('Number of days with Rain or Sun')
title('Weather forecast for 50 simulations each 14 days')
%plot 


 figure(2)
subplot(2,1,1)
plot(obs(1:days))          
xlim([0 days])
ylim([0.5 2.5])
ax = gca
ax.YTick = [1,2]
ax.YTickLabel = {'sunny', 'rainy'}

xlabel('Day')
ylabel('Weather')
title('Weather forecast for 14 days')
%plot 

 
 sun = matrix_counts(:,1)
%vector element of sunny days count
rainy= matrix_counts(:,2)
%vector element of rainy days count

cumulative_frequency_sun= sum(sun)
%sum all days that are sunny
cumulative_frequency_rain= sum(rainy)
%sum all days that are rainy
 
average_frequency_sun= cumulative_frequency_sun/sims
%average days that are sunny in 14 days 
average_frequency_rain= cumulative_frequency_rain/sims
%average days that are rainy in 14 days 
 
Average_Sunny_Days= round(average_frequency_sun)
Average_Rainy_Days= round(average_frequency_rain)
%round to integer numbers 

table(Average_Sunny_Days,Average_Rainy_Days)

%with this transition matrix tm = [0.4, 0.6; 0.3,0.7];
%average sunny days: 6 
%average rainy days: 8
%there is a considerable change in the number of rainy and sunny days, the
%larger relative change in probabilities the larger change in average days
%sunny and rainy 




  