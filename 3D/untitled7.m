%% Le plus petit sphere englobant (algorithme naif)
% SABIR ILYASS
close all; clearvars;

%% construire le nuage de points dans le carré [0,1]²
n = 3;
points = rand(3,n);

%% affichage de nuage de points
figure;
plot3(points(1,:), points(2,:), points(3,:), '.');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1 0 1]); hold on;

[CENTRE_X, CENTRE_Y, CENTRE_Z, RAYON] = cercle3D(points(1,1), points(2,1), points(3,1), points(1,2), points(2,2), points(3,2), points(1,3), points(2,3), points(3,3));

[x,y,z]=sphere(50);
 
x = x * RAYON + CENTRE_X;
y = y * RAYON + CENTRE_Y;
z = z * RAYON + CENTRE_Z;
 
% surf(x,y,z)
% axis equal

surf(x,y,z,'FaceAlpha',.3,'EdgeColor','none');
axis equal
