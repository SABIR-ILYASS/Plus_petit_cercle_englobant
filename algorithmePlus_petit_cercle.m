%% Le plus petit cercle englobant
% SABIR ILYASS
close all; clearvars;

%% definition d'une fonction distance euclidienne
euclidienDistance = @(px, py, qx, qy) sqrt((px - qx)^2 + (py - qy)^2);

%% construire le nuage de points dans le carré [0,1]²
n = 20;
points = rand(2,n);

%% affichage de nuage de points
figure;
plot(points(1,:), points(2,:), '.');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1]); hold on;

centreX = (points(1,1) + points(1,2))/2;
centreY = (points(2,1) + points(2,2))/2;
rayon = euclidienDistance(points(1,1), points(2,1), centreX, centreY);

for i = 3:n
    distance = euclidienDistance(points(1,i), points(2,i), centreX, centreY);
    if (distance > rayon)
        [centreX, centreY, rayon] = plusPetitCercleParUnPoint(points(1:2, 1:i - 1), points(1,i), points(2,i));
    end
end

centre = [centreX centreY];
pos = [centre - rayon 2 * rayon 2 * rayon];
rectangle('Position',pos,'Curvature',[1 1]);
axis equal;

