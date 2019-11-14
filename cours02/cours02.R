## librairies ------

library(tidyverse)
getwd()

setwd("/home/sy/Documents/Cours/IPJ/ipj_ddj_20192020/cours02/")

## Premiers contacts ----

prenoms <- read_csv2("../data/liste-des-prenoms-par-annee.csv")

names(prenoms)
head(prenoms)
glimpse(prenoms)

unique(prenoms$ANNEE)
table(prenoms$ANNEE)

qplot(prenoms$ANNEE)

## Manipulation BDD ----

prenoms[1:20,]$SEXE == "M"
x

# filter
filter(prenoms,NOMBRE > 150)

filter(prenoms,NOMBRE > 130 & SEXE == "M")

filter(prenoms, str_detect(PRENOM,"ë"))

filter(prenoms, PRENOM %in% c("Aimée","Chloé"))

c <- c("Aimée","Chloé", "Maxime")

filter(prenoms, PRENOM %in% c)

filter(prenoms, PRENOM == "Aimée" | PRENOM == "Chloé")


# select
select(prenoms,PRENOM)[1:5,] # permet de ne retenir que la variagble PRENOM

p <- select(prenoms,c(ANNEE,SEXE,PRENOM,NOMBRE))


## helpers
select(prenoms, contains("ANNEE"))[1:3,]

# mutate
mutate(p, majeur = ANNEE < 2001)

table(mutate(p, majeur = ANNEE < 2001)$majeur)

p1 <- mutate(p, majeur = ANNEE < 2001)

table(p1$majeur)


# arrange
arrange(p, NOMBRE)

arrange(p, PRENOM)
arrange(p, PRENOM, ANNEE)

## desc()
arrange(p, desc(NOMBRE))

# distinct
distinct(p, ANNEE)
top_n(p,5,NOMBRE)
top_n(p,-5,NOMBRE)

# pipe
prenoms %>% filter(SEXE == "F", ANNEE < 2001) %>% 
  select(PRENOM,ANNEE,NOMBRE) %>% 
  top_n(5,NOMBRE)

prenoms %>% filter(SEXE == "F", ANNEE < 2001) %>% 
  select(PRENOM,ANNEE,NOMBRE) %>% 
  top_n(5,NOMBRE) %>% 
  arrange(desc(NOMBRE))

p %>% filter(str_detect(PRENOM,"Yan") & NOMBRE > 1) %>% 
  distinct(PRENOM)

# Group summarise

p %>% filter(PRENOM %in% c("Yannick","Yanick","Yanik")) %>% 
  group_by(PRENOM) %>% 
  summarise(effectif = sum(NOMBRE))

p %>% filter(SEXE == "M") %>% # je me concentre sur les prénoms masculins
  group_by(ANNEE) %>%         # je groupe par année
  summarise(n = n()) %>%      # je compte le nombre d'observation avec n()
  arrange(desc(n))            # je tri par n pour avoir un classement


# nous allons nous intéresser aux prénoms qui commencent par un K
p %>% filter(str_detect(PRENOM, "^K")) %>% 
  group_by(ANNEE,SEXE) %>% # nous groupons ensuite par année et sexe
  # et faisons la somme des enfants nommés ainsi
  summarise(effectif = sum(NOMBRE)) %>%
  arrange(desc(ANNEE))
