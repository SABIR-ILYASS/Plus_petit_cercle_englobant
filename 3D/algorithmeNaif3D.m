%% Le plus petit sphere englobant (algorithme naif)
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

%% determination des deux points les plus distants:
RAYON = 0; index1 = 0; index2 = 2;
for i = 1:n
    for j = 1:n
        if (j ~= i)
            dis = sqrt((points(1,i) - points(1,j))^2 + (points(2,i) - points(2,j))^2 + (points(3,i) - points(3,j))^2);
            if (dis > RAYON)
                RAYON = dis / 2; index1 = i; index2 = j;
            end
        end
    end
end

count = 2;
CENTRE_X = (points(1, index1) + points(1, index2))/2; 
CENTRE_Y = (points(2, index1) + points(2, index2))/2;
CENTRE_Z = (points(3, index1) + points(3, index2))/2;

for i = 1:n
    if (i ~= index1 && i ~= index2)
        dis = sqrt((points(1,i) - CENTRE_X)^2 + (points(2,i) - CENTRE_Y)^2 + (points(3,i) - CENTRE_Z)^2);
        if (dis < RAYON)
            count = count + 1;
        end
    end
end

if (count < n)
    % determination des 3 points le plus distants
    [index1, index2, index3] = pointsLesPlusDistant(points, n);
    [CENTRE_X, CENTRE_Y, CENTRE_Z, RAYON] = cercle3D(points(1, index1), points(2, index1), points(3, index1), points(1, index2), points(2, index2), points(3, index2), points(1, index3), points(2, index3), points(3, index3));
    count = 3;
    for i = 1:n
        if (i ~= index1 && i ~= index2 && i ~= index3)
            dis = sqrt((points(1,i) - CENTRE_X)^2 + (points(2,i) - CENTRE_Y)^2 + (points(3,i) - CENTRE_Z)^2);
            if (dis < RAYON)
                count = count + 1;
            end
        end
    end
end

if (count < n)
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
end


[x,y,z]=sphere(50);
 
x = x * RAYON + CENTRE_X;
y = y * RAYON + CENTRE_Y;
z = z * RAYON + CENTRE_Z;
 
% surf(x,y,z)
% axis equal

surf(x,y,z,'FaceAlpha',.3,'EdgeColor','none');
axis equal