# Plus petit cercle
Étant donné un ensemble P de points dans le plan, on cherche à déterminer le plus petit cercle contenant tous les points.

## Algotithme naïf
---
title: " Algotithme plus petit cercle naïf" </br>
output: Cercle Plus petit cercle englobant le nuage de points de l'entrée

---
```{r, eval = FALSE}
Point1, Point2 <- Les 2 points les plus distants du cercle
Cercle <- Cercle englobant les Point1, Point2
count = 2
// tester ci D1 englobe tous les autres points.
pour i <- 1 à n
   si  not( Point_i ∈ Cercle)
       count <- count + 1
fi pour 
si (count < n)
   pour i <- 1 à n
    pour j <- 1 à n
        si (j != i)
            pour k <- 1 à n
                si (k != i et k != j)
                    Di,j,k <-Cercle(P_i, P_j, P_k)
                    // tester si ce cercle englobe tous les autres points
                    si oui
                        si le rayon de Di,j,k < le rayon de Cercle
                            Cerlce <- Di,j,k
                        fin si
                    fin si
                fin si
            fin pour
        fin si
    fin pour
fin pour   
```
