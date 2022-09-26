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

while (isInCercle == false || isDifferentPoints == false)

    % tester ces 3 points differents
    if (i ~= j || i ~= k)
        isDifferentPoints = false;
    else
        isDifferentPoints = true;
    end

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
    if (count == n)
        isInCercle = true;
        break;
    end
    if (k < n)
        k = k + 1;
    elseif (k == n && j < n)
        j = j + 1;
        k = 1;
    elseif (j == n && i < n)
        i = i + 1;
        j = 1;
    else
        break
    end
end

[milieux, milieuy, rayon] = Disque(points(1,i), points(2,i), points(1,j), points(2,j), points(1,k), points(2,k));
centre = [milieux milieuy];
pos = [centre - rayon 2 * rayon 2 * rayon];
rectangle('Position',pos,'Curvature',[1 1]);
axis equal;
