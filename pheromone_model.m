% Pheromone model used to probabilistically select solution components of
% ant tour

function [new_places]=pheromone_model(start_places,n,ants,pt,alpha,beta,att)

for i=1:ants
    attc=att;
    
    for j=1:n-1
        c=start_places(i,j);
        attc(:,c)=0;  %visited edges will have zero attractiveness
        prob=(pt(c,:).^alpha) .* (attc(c,:).^beta);
        s=(sum(prob));
        prob=prob/s;
        r=rand;
        
        %roulette wheel selection
        s=0;
        for k=1:n
            s=s+prob(k);
            if r<=s
                start_places(i,j+1)=k;
                break
            end
        end
    end
end
new_places=start_places;
                
            
    
