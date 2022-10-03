function [centreX, centreY, centreZ, rayon] = Sphere(p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z, p4x, p4y, p4z)

% notons [centreX, centreY, centreZ] les coordonnées du centre de la sphère
% circonscrit aux 4 points
% on obtient des équations de type:
% 2(pix - pjx) centreX +  2(piy - pjy) centreY + 2(piz - pjz) centreZ = pix² - pjx² + piy² -
% pjy² + piz² - pjz² pour i,j = 1,2,3,4et i#j

matrixCoefficient  = [2 * (p1x - p4x), 2 * (p1y - p4y), 2 * (p1z - p4z);
    2 * (p2x - p4x), 2 * (p2y - p4y), 2 * (p2z - p4z);
    2 * (p3x - p4x), 2 * (p3y - p4y), 2 * (p3z - p4z)];

matrixResult = [p4x^2 - p1x^2 + p4y^2 - p1y^2 + p4z^2 - p1z^2;
    p4x^2 - p2x^2 + p4y^2 - p2y^2 + p4z^2 - p2z^2;
    p4x^2 - p3x^2 + p4y^2 - p3y^2 + p4z^2 - p3z^2];

Centre = pinv(matrixCoefficient) * matrixResult;

centreX = Centre(1,1); centreY = Centre(2,1); centreZ = Centre(3,1);

rayon = sqrt((p1x - centreX)^2 + (p1y - centreY)^2 + (p1z - centreZ)^2);
