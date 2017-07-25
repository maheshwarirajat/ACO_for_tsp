function aco()

% Genereate coordinates of cities
prompt='Enter number of cities';
n=input(prompt);
[cost,cities]=gencities(n);

% plotting cities
subplot(2,1,1);
plot(cities(1,:),cities(2,:),'o','MarkerFaceColor','r','MarkerEdgeColor','g','MarkerSize',10);
title('Coordinates of Cities');
xlabel('x  (km)');
ylabel('y  (km)');


% Attractiveness of an edge(component solution)- if bigger cost that means
% less attractive
att=zeros(n);
for i=1:n
    for j=1:n
        if cost(i,j)==0
            att(i,j)=0;
        else
            att(i,j)=1/cost(i,j);
            
        end
    end
end


%some initializations
iter=n; %maximum number of iterations
ants=n; %number of ants
pt=(0.001*ones(n)); % intial phereomone trace
alpha=4;
beta=1;
rho=0.2; % evaporation rate

for i=1:iter

% Assign random starting fixpositions to ants
    start_places=fix(1+rand(n,1)*(n-1));
% Pheromone model for solution construction
    [tour]=pheromone_model(start_places,n,ants,pt,alpha,beta,att);
% adding starting point in their tour
    tour=horzcat(tour, tour(:,1));
% calculating cost of each tour
    tour_cost=calculate_cost(tour,ants,n,cost);
% Update the tracing
    [pt]=trace_update(pt,n,ants,rho,tour_cost,tour);
% store best tours and minimum cost of tour of each iteration
    [min_cost(i),idx]=min(tour_cost);
    best_so_far(i,:)=tour(idx,:);
    
end


[k,l]=min(min_cost);
for i=1:n+1
    X(i)=cities(1,best_so_far(l,i));
    Y(i)=cities(2,best_so_far(l,i));
end
subplot(2,1,2);
plot(X,Y,'--o','MarkerEdgeColor','b','MarkerFaceColor','k','MarkerSize',10);
xlabel('x (km)');
ylabel('y (km)');
title(['minimum cost = ',num2str(k)]);
end
    
    