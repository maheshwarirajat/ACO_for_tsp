% Generate cities and cost of travelling from city i to city j
function [cost, cities]=gencities(n)

%random positions to cities
cities=randi([1,100],2,n);

% we're assuming cost is proportional to distance between cities
cost=zeros(n,n);
for i=1:n
    for j=1:n
        cost(i,j)=(cities(1,i)-cities(1,j))^2 + (cities(2,i)-cities(2,j))^2;
    end
end

