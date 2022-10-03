%% Le plus petit cercle englobant (algorithme naive)
% SABIR ILYASS
close all; clearvars;

%% construire le nuage de points dans le carré [0,1]²
n = 20; % n >= 3
points = rand(2,n);

%% affichage de nuage de points
figure;
plot(points(1,:), points(2,:), '.');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1]); hold on;

%% l'algo naive: (pour n>=4)
RAYON = Inf; CENTRE_X = 0; CENTRE_Y = 0;

for i = 1:n
    for j = 1:n
        if (j ~= i)
            for k = 1:n
                if (k ~= i && k ~= j)
                    [milieux, milieuy, rayon] = Disque(points(1,i), points(2,i), points(1,j), points(2,j), points(1,k), points(2,k));
                    count = 3;
                    for l = 1:n
                        if (l ~= i && l ~= j && l ~= k)
                            distance = sqrt((points(1,l) - milieux)^2 + (points(2,l) - milieuy)^2);
                            if (distance <= rayon)
                                count = count + 1;
                            end
                        end
                    end
                    if ( count == n)
                        if rayon < RAYON
                            RAYON = rayon;
                            CENTRE_X = milieux;
                            CENTRE_Y = milieuy;
                        end
                    end
                end
            end
        end
    end
end

centre = [CENTRE_X CENTRE_Y];
pos = [centre - RAYON 2 * RAYON 2 * RAYON];
rectangle('Position',pos,'Curvature',[1 1]);
axis equal;
