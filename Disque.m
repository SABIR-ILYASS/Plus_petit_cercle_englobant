function [centrex, centrey, rayon] = Disque(p1x, p1y, p2x, p2y, p3x, p3y)

matriceDilta = [p1x, p1y, 1; p2x, p2y, 1; p3x, p3y, 1];
delta = 2 * det(matriceDilta);

matrixeCentreX = [p1x^2 + p1y^2, p1y, 1; p2x^2 + p2y^2, p2y, 1; p3x^2 + p3y^2, p3y, 1];
matrixeCentreY = [p1x^2 + p1y^2, p1x, 1; p2x^2 + p2y^2, p2x, 1; p3x^2 + p3y^2, p3x, 1];



centrex = det(matrixeCentreX) / delta; 
centrey = -det(matrixeCentreY) / delta;

a = sqrt((p2x - p3x)^2 + (p2y - p3y)^2);
b = sqrt((p1x - p3x)^2 + (p1y - p3y)^2);
c = sqrt((p1x - p2x)^2 + (p1y - p2y)^2);
p = (a + b + c)/2;

rayon = (a * b * c)/(4 * sqrt(p * (p - a) * (p - b) * (p - c)));