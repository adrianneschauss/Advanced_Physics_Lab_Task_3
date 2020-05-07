
%poker 
%Disclaimer: a lot of help was required for this excersise so the overall
%code was not done at the top of my head but was done with people's help and the internet 



Suit  = 1:13
%this is the deck of just hearts, clovers, spades, diamond 
Wholedeck     = repmat(Suit,1,4)
%produces four sets of suits to make whole deck (52 cards)
numCards= 52

Simulations = 10;
Players     = 4;
Hand  = 5;


counttotal     = zeros(3,Players)
%set up array used for the total cards in hand counting doubles triples
%quadruples 

for i = 1:Simulations,
     
      shuffle = randperm(numCards)
      %shuffle entire deck from 1 to 52 
      deckShuffled = Wholedeck(shuffle)
      %assign the values 1 to 13 to cards to distinguish suits
     
      deal = deckShuffled(1:Players*Hand)
      % Deal hands (5x cards a player)
      
      deal = reshape(deal,Players,Hand)
      %matrix arrangement, 4x5 matrix for players (rows) and corresponding
      %cards (columns)
      
      deal_cards= deal'
      %transpose
      
      cardCount = histc(deal_cards,Suit)
      %count the frequency of each card number in the hands
      
      handCount = histc(cardCount,0:4)
     %maximum amount we can have card is 4 times therefore range 0 to 4 
     %count the frequency of having 0 cards of a type, 1 card of one type,
     %2 cards of one type up until 4 of a type
      
     Count = handCount(3:end,1:4)
     %counts of none or one are taken out 
    
      
    
     counttotal = counttotal + Count
     
     total_two= sum(counttotal(1,:))
     
     total_three= sum(counttotal(2,:))
     
     total_four= sum(counttotal(3,:))
 
     
for i = 1:4
y= deal_cards(:,i);
y_1= sort(y(:,1),'ascend')


for i=1:9
A= (i:i+1);
end 
if all(ismember(A,y_1)==1)

    
else 

end
end
end


% Plot results
figure;
subplot(2,1,1)
bar(counttotal./Simulations);
grid on;
title('Probability of cards for each player');
ylabel('Probablity')
set(gca,'XTick',1:3,'XTickLabel',{'Double','Triple',...
    'Quadruple'});
subplot(2,1,2)
bar(sum(counttotal,2)./(Simulations*Players));
grid on;
title('Average Hand Probability');
ylabel('Probability')
set(gca,'XTick',1:3,'XTickLabel',{'Double','Triple',...
    'Quadruple'});

%The model with several iterations does follow the expected pattern, for
%having a higher number of identicalcards for example triple, the
%probability is extremely low, while doubles are more frequent 
%this is best recognized by the graph Average Hand Probability