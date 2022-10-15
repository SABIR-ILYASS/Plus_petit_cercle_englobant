function [centreX, centreY, centreZ, rayon] = cercle3D(p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z)

% determination de l'équation du plan: ax + by + z = d
matrixPlan = [p1x - p3x, p1y - p3y; p2x - p3x, p2y - p3y];
PlanResult = [p3z - p1z; p3z - p2z];

produit = pinv(matrixPlan) * PlanResult;

a = produit(1,1); b = produit(2,1);
d = a * p1x + b * p1y + p1z;

matrixCoefficient  = [2 * (p1x - p3x), 2 * (p1y - p3y), 2 * (p1z - p3z);
    2 * (p2x - p3x), 2 * (p2y - p3y), 2 * (p2z - p3z);
    a, b, 1];

matrixResult = [p1x^2 - p3x^2 + p1y^2 - p3y^2 + p1z^2 - p3z^2;
    p2x^2 - p3x^2 + p2y^2 - p3y^2 + p2z^2 - p3z^2;
    d];

Centre = pinv(matrixCoefficient) * matrixResult;

centreX = Centre(1,1); centreY = Centre(2,1); centreZ = Centre(3,1);

rayon = sqrt((p1x - centreX)^2 + (p1y - centreY)^2 + (p1z - centreZ)^2);
