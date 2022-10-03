%% Le plus petit cercle englobant (algorithme naive)
% SABIR ILYASS
close all; clearvars;

%% construire le nuage de points dans le carré [0,1]²
n = 20;
points = rand(2,n);

%% affichage de nuage de points
figure;
plot(points(1,:), points(2,:), '.');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1]); hold on;

%% l'algo naive: (pour n>=4)
isInCercle = false;
i = 1; j = 1; k = 1;
isDifferentPoints = false;
RAYON = Inf; CENTRE_X = 0; CENTRE_Y = 0;

while (i + j + k <= 3 * n - 1)

    % tester ces 3 points differents
    if (i ~= j || i ~= k)
        isDifferentPoints = true;
    else
        isDifferentPoints = false;
    end
    
    if (isDifferentPoints == true)
        [milieux, milieuy, rayon] = Disque(points(1,i), points(2,i), points(1,j), points(2,j), points(1,k), points(2,k));
        count = 3;
        for l = 1:n
            if (l ~= i && l ~= j && l ~= k)
                distance = sqrt((points(1,l) - milieux)^2 + (points(2,l) - milieuy)^2);
                if (rayon < RAYON && distance <= rayon)
                    count = count + 1;
                end
            end            
        end
        if (count == n)
            CENTRE_X = milieux; CENTRE_Y = milieuy; RAYON = rayon;
        end
    end
    if (k < n)
        k = k + 1;
    elseif (k == n && j < n)
        j = j + 1;
        k = 1;
    elseif (j == n && i < n)
        i = i + 1;
        j = 1;
    end
end

% [milieux, milieuy, rayon] = Disque(points(1,i), points(2,i), points(1,j), points(2,j), points(1,k), points(2,k));
centre = [CENTRE_X CENTRE_Y];
pos = [centre - RAYON 2 * RAYON 2 * RAYON];
rectangle('Position',pos,'Curvature',[1 1]);
axis equal;
