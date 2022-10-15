function [centreX, centreY, centreZ, rayon] = plusPetitCercleParUnPoint3D(P, qx, qy, qz)

n = size(P,2);
centreX = (P(1,1) + qx)/2;
centreY = (P(2,1) + qy)/2;
centreZ = (P(3,1) + qz)/2;

rayon = sqrt((P(1,1) - centreX)^2 + (P(2,1) - centreY)^2 + (P(3,1) - centreZ)^2);

for i = 2:n 
    distance = sqrt((P(1,i) - centreX)^2 + (P(2,i) - centreY)^2 + (P(3,i) - centreZ)^2);
    if (distance > rayon)
        [centreX, centreY, centreZ, rayon] = plusPetitCercleParDeuxPoint3D(P(1:3, 1:i-1), P(1,i), P(2,i), P(3,i), qx, qy, qz);
    end
end