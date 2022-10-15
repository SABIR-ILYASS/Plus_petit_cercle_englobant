function [centreX, centreY, rayon] = plusPetitCercleParDeuxPoint(P, qx, qy, rx, ry)

n = size(P,2);
centreX = (rx + qx)/2;
centreY = (ry + qy)/2;
rayon = sqrt((qx - centreX)^2 + (qy - centreY)^2);

for k = 1:n
    distance = sqrt((P(1,k) - centreX)^2 + (P(2,k) - centreY)^2);
    if (distance > rayon)
        [centreX, centreY, rayon] = Disque(P(1,k), P(2,k), qx, qy, rx, ry);
    end
end