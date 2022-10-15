function [index1, index2, index3] = pointsLesPlusDistant(nuagePoints, taille)

SURFACE = 0;
for i = 1:taille
    for j = 1: taille
        if (j ~= i)
            for k = 1:taille
                if (k ~= i && k ~= j)
                    
                    a = sqrt((nuagePoints(1,i) - nuagePoints(1,j))^2 + (nuagePoints(2,i) - nuagePoints(2,j))^2 + (nuagePoints(3,i) - nuagePoints(3,j))^2);
                    b = sqrt((nuagePoints(1,i) - nuagePoints(1,k))^2 + (nuagePoints(2,i) - nuagePoints(2,k))^2 + (nuagePoints(3,k) - nuagePoints(3,k))^2);
                    c = sqrt((nuagePoints(1,k) - nuagePoints(1,j))^2 + (nuagePoints(2,k) - nuagePoints(2,j))^2 + (nuagePoints(3,k) - nuagePoints(3,j))^2);

                    p = (a + b + c) / 3;
                    surface = sqrt(p * (p - a) * (p - b) * (p - c));

                    if (surface > SURFACE)
                        SURFACE = surface;
                        index1 = i; index2 = j; index3 = k;
                    end
                end
            end
        end
    end
end

