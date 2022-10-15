%% Le plus petit sphere englobant
% SABIR ILYASS
close all; clearvars;

%% definition d'une fonction distance euclidienne
euclidienDistance = @(px, py, pz, qx, qy, qz) sqrt((px - qx)^2 + (py - qy)^2 + (pz - qz)^2);

%% construire le nuage de points dans le carré [0,1]²
n = 20;
points = rand(3,n);

%% affichage de nuage de points
figure;
plot3(points(1,:), points(2,:), points(3,:), '.');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1 0 1]); hold on;

centreX = (points(1,1) + points(1,2))/2;
centreY = (points(2,1) + points(2,2))/2;
centreZ = (points(3,1) + points(3,2))/2;

rayon = euclidienDistance(points(1,1), points(2,1), points(3,1), centreX, centreY, centreZ);

for i = 3:n
    distance = euclidienDistance(points(1,i), points(2,i), points(3,i), centreX, centreY, centreZ);
    if (distance > rayon)
        [centreX, centreY, centreZ, rayon] = plusPetitCercleParUnPoint3D(points(1:3, 1:i - 1), points(1,i), points(2,i), points(3,i));
    end
end


centre = [centreX, centreY, centreZ];

[x,y,z]=sphere(50);
 
x = x * rayon + centreX;
y = y * rayon + centreY;
z = z * rayon + centreZ;
 
surf(x,y,z,'FaceAlpha',.3,'EdgeColor','none');
axis equal
