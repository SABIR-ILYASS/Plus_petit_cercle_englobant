function [centreX, centreY, centreZ, rayon] = plusPetitCercleParDeuxPoint3D(P, qx, qy, qz, rx, ry, rz)

n = size(P,2);
centreX = (rx + qx)/2;
centreY = (ry + qy)/2;
centreZ = (rz + qz)/2;

rayon = sqrt((qx - centreX)^2 + (qy - centreY)^2 + (qz - centreZ)^2);

for k = 2:n
    distance = sqrt((P(1,k) - centreX)^2 + (P(2,k) - centreY)^2 + (P(3,k) - centreZ)^2);
    if (distance > rayon)
        [centreX, centreY, centreZ, rayon] = plusPetitCerclePartroisPoint3D(P(1:3, k-1),P(1,k), P(2,k), P(3,k), qx, qy, qz, rx, ry, rz);
    end
end