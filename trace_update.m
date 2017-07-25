% updates traces
function [pt]= trace_update(pt,n,ants,rho,tour_cost,tour)

% this will ensure that increase in tracing would be singnificant even if the cost function value is too large or too small
Q=min(tour_cost)*0.97;

for i=1:ants
    for j=1:n
        pt(tour(i,j),tour(i,j+1))= (1-rho)*pt(tour(i,j),tour(i,j+1)); %evaporation
        pt(tour(i,j),tour(i,j+1))= pt(tour(i,j),tour(i,j+1)) + Q/tour_cost(i); %deposition
    end
end
end