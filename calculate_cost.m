% function to calcualte cost of tour traversed by each of the m ants in ith iteration

function [tour_cost]=calculate_cost(tour, ants, n,cost)
tour_cost=zeros(ants,1);
for i=1:ants
    c=0;
    for j=1:n
        c=c + cost(tour(i,j),tour(i,j+1));
    end
    tour_cost(i)=c;
end


    