function [centreX, centreY, centreZ, rayon] = plusPetitCerclePartroisPoint3D(P, qx, qy, qz, rx, ry, rz, tx, ty, tz)

n = size(P,2);
[centreX, centreY, centreZ, rayon] = cercle3D(qx, qy, qz, rx, ry, rz, tx, ty, tz);

for k = 1:n
    distance = sqrt((P(1,k) - centreX)^2 + (P(2,k) - centreY)^2 + (P(3,k) - centreZ)^2);
    if (distance > rayon)
        [centreX, centreY,centreZ, rayon] = Sphere(P(1,k), P(2,k), P(3,k), qx, qy, qz, rx, ry, rz, tx, ty, tz);
    end
end