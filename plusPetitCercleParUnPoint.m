function [centreX, centreY, rayon] = plusPetitCercleParUnPoint(P, qx, qy)

n = size(P,2);
centreX = (P(1,1) + qx)/2;
centreY = (P(2,1) + qy)/2;
rayon = sqrt((P(1,1) - centreX)^2 + (P(2,1) - centreY)^2);

for i = 2:n 
    distance = sqrt((P(1,i) - centreX)^2 + (P(2,i) - centreY)^2);
    if (distance > rayon)
        [centreX, centreY, rayon] = plusPetitCercleParDeuxPoint(P(1:2, 1:i-1), P(1,i), P(2,i), qx, qy);
    end
end