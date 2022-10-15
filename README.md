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

## Algotithme incrémental

Lorsqu’on ajoute un point pi supplémentaire, deux cas de figure peuvent se présenter:
• le point pi est inclus dans le disque courant Di−1, le disque n’est pas modifié: Di ← Di−1;
• le point pi n’est pas inclus dans le disque courant Di−1, le disque doit être mis à jour.
---
title: " Algotithme_plus_petit_cercle"
input: un ensemble P de points du plan
output: le plus petit cercle englobant de P
---
```{r, eval = FALSE}
D2 ← disque_defini_par_deux_points(p1, p2)
pour i ← 3 à n
    si pi ∈ Di−1 faire
        Di ← Di−1
    sinon faire
        Di ←plus_petit_cercle_par_un_point({p1, p2, · · · , pi−1}, pi)
    fin si
fin pour
```
La fonction disque_defini_par_deux_points(p, q) renvoie simplement le disque de diamètre [pq].
Dans le cas où le point pi n’appartient pas au disque Di−1, le cercle est modifié grâce à l’algorithme ci-dessous de recherche de plus petit cercle sous contrainte de passer par le point q

---
title: " plus_petit_cercle_par_un_point(P, q)"
input: un ensemble P de points du plan et un point q
output: le plus petit cercle englobant de P passant par q
---
```{r, eval = FALSE}
D1 ← disque_defini_par_deux_points(p1, q)
pour j ← 2 à n
    si pj ∈ Dj−1 faire
        Dj ← Dj−1
    sinon faire
        Dj ←plus_petit_cercle_par_deux_points({p1, p2, · · · , pj−1}, pj, q)
    fin si
fin pour
```
Appliquons une dernière fois la même démarche incrémentale:

---
title: " plus_petit_cercle_par_deux_points(P, q1, q2)"
input: un ensemble P de points du plan et deux points q1 et q2
output: le plus petit cercle englobant de P passant par q1 et q2

---
```{r, eval = FALSE}
D0 ← disque_defini_par_deux_points(q1, q2)
pour k ← 1 à n
    si pk ∈ Dk−1 faire
    Dk ← Dk−1
    sinon
        Dk ←disque_defini_par_trois_points(pk, q1, q2)
    fin si
fin pour
```
