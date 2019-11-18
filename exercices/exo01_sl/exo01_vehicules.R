## librairies -----

# mettez ici les librairies utilisées

library(tidyverse)

setwd("/home/sy/Documents/Cours/IPJ/ipj_ddj_20192020/exercices/")

## data ----

# précisez les raisons du choix de cette BDDs en comment
# précisez les éventuelles manipulations pour réduire la taille du fichier ici

v <- read_csv("./exo01_sl/data/vehicules-2018.csv") # utilisez le chemin relatif


## Q1 : rédigez ici la première question que vous souhaitez poser ----

# mettez ici vos manips et commentez les étapes

table(v$obs) # le code 00 est largement majoritaire

# à quoi correspond le code 00 ?
# pour le savoir, reportez-vous à la documentation

## Q2 : la 2è question ----


## Q3 : la 3è question ----
