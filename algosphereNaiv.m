%% Le plus petit cercle englobant (algorithme naive)
% SABIR ILYASS
close all; clearvars;

%% construire le nuage de points dans le carré [0,1]²
n = 20;
points = rand(3,n);

%% affichage de nuage de points
figure;
plot3(points(1,:), points(2,:), points(3,:), '.');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1 0 1]); hold on;

%% l'algo naive: (pour n>=4)
RAYON = Inf; CENTRE_X = 0; CENTRE_Y = 0; CENTRE_Z = 0;

for i = 1:n
    for j = 1:n
        if (j ~= i)
            for k = 1:n
                if (k ~= i && k ~= j)
                    for l = 1:n
                        if (l ~= i && l ~= j && l ~= k)
                            [centreX, centreY, centreZ, rayon] = Sphere(points(1,i), points(2,i), points(3,i), points(1,j), points(2,j), points(3,j), points(1,k), points(2,k), points(3,k), points(1,l), points(2,l), points(3,l));
                            count = 4;
                            for m = 1:n
                                if (m ~= i && m ~= j && m ~= k && m ~= l)
                                    distance = sqrt((points(1,m) - centreX)^2 + (points(2,m) - centreY)^2 + (points(3,m) - centreZ)^2);
                                    if (distance <= rayon)
                                        count = count + 1;
                                    end
                                end
                            end
                            if (count == n)
                                if rayon < RAYON
                                    RAYON = rayon;
                                   CENTRE_X = centreX;
                                    CENTRE_Y = centreY;
                                    CENTRE_Z = centreZ;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

centre = [CENTRE_X CENTRE_Y, CENTRE_Z];

[x,y,z]=sphere(50);
 
x = x * RAYON + CENTRE_X;
y = y * RAYON + CENTRE_Y;
z = z * RAYON + CENTRE_Z;
 
surf(x,y,z)
axis equal
