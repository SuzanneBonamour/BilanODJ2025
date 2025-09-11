# # STEP 0 : CHOOSE PARAMETERS
# 
# ###########################
# #   Paramètres généraux   #
# ###########################
# 
# # Nom du répertoire où les données sont mises (sans caractères spéciaux)
# # Exemple : "STOC_2023_Ile_de_France"
# repo <- "01_STOC_carre_local_441"
# 
# # Nom du jeu de données .csv à charger (sans caractères spéciaux)
# # Exemple : "countingData.csv"
# Data <- "countingdata_2001_2024.csv"
# 
# # Nom de l'observatoire étudié (sans caractères spéciaux)
# obs <- "STOC"
# 
# # Nom de l'échelle d'observation (sans caractères spéciaux)
# # Exemple : "France" ou "Bretagne" ou "ONF" ou ...
# spatialScale <- "France"
# 
# # Est-ce que les absences (0) doivent être générées par la routine ?
# createAbsence <- TRUE # FALSE
# 
# # Est-ce que la tendance court-terme doit être réalisée ?
# makeShortTrend <- FALSE # FALSE
# 
# # Est-ce que le gamm doit être réalisé ?
# makeGammTrend <- FALSE # FALSE
# 
# # Est-ce que les tendances quadratiques doivent être réalisées ?
# makeQuadraticTrend <- FALSE # FALSE
# 
# # Est-ce qu'un graphe résumé par groupe d'espèces doit être réalisé ?
# makeGroupPlot <- TRUE # FALSE
# 
# # Est-ce que le pdf doit être créé ?
# makePDF <- TRUE # FALSE
# 
# ###########################
# # Optionnel : performance #
# ###########################
# 
# # Les espèces doivent-elles être traitées en parallèle ?
# parallelizeSpecies <- FALSE # TRUE
# 
# # Si oui, combien de processeurs sont à disposition ?
# nbCores <- 6
# 
# # Quel est le package à utiliser pour foreach()%dopar%{...} ?
# parallelPackage <- "doParallel" # clusters --> "doMPI" local --> "doParallel"
# 
# #########################
# # Formatter les données #
# #########################
# 
# # Quelles espèces souhaitez-vous analyser ?
# # Si NULL, toutes les espèces sont analysées
# speciesList <- NULL #c("LUSSVE", "CORGAR","CLAGLA", "NUMARQ", "SYLUND","LARFUS", "TETRAX") # c("Tetvir","Leppun","Phogri")
# speciesList <- c("ACCGEN")
# # speciesList <- c("GARGLA", "PHOOCH", "SITEUR", "CORCOR", "FRICOE", "TROTRO")
# # speciesList <- c("GARGLA")
# 
# # Quelles sont les dates de début et de fin à prendre en compte ?
# # Si NULL, toutes les années sont utilisées
# yearRange <- NULL
# # yearRange <- c(2014, 2022)
# 
# 
# ##########################
# # Construire les modèles #
# ##########################
# 
# # Quelle est la distribution à appliquer ?
# # (e.g: gaussian, poisson, nbinom2, binomial, betabinomial)
# # Si NULL, la routine la déduit automatiquement
# distribution <- NULL
# 
# # Quelle est la variable à expliquer ?
# interestVar <-  "abondance"   # c("abond_cumul", "fail")
# # interestVar <-  "nb_contacts"
# 
# 
# # Quels sont les effets fixes continus / numériques à considérer ?
# # fixedEffects <-  c("year", "prop_for", "prop_urb", "prop_water", "prop_other", "altitude", "longlat")
# fixedEffects <- c("year", "longlat")
# # fixedEffects <- c("year", "temps_enr_log", "foret", "urbain", "prairie")
# 
# # Quelles sont les effets fixes catégoriels à considérer (hors year) ?
# # NULL, si pas de variables catégorielles
# factorVariables <- c("passage")
# # factorVariables <- c("passage", "code_habitat_first")
# # factorVariables <- c("expansion_direct", "protocole")
# 
# # Quel est le niveau de référence pour la variable  ?
# # Si NULL, automatiquement mis à la moyenne des années
# # Sinon, indiquer un niveau e.g, 2001, 2010, ...
# contr <- 'mean'
# 
# # Quels sont les effets aléatoires à considérer ?
# # NULL si pas d'effets aléatoires simples à considérer
# randomEffects <- NULL
# # randomEffects <- c("gr_mat")
# 
# # Quels sont les effets emboîtés à considérer ?
# # list() si pas d'effets emboîtés
# # NB : si une variable est renseignée dans l'effet emboîté, elle ne doit pas être mise dans l'effet aléatoire
# # nestedEffects <- list(c("point", "site"))
# nestedEffects <- list(c("site", "num_dep"))
# # nestedEffects <- list(c("point", "site"))
# 
# # Quels sont les effets de pentes aléatoires à considérer ?
# # list() si pas de pentes aléatoires
# slopeRandomEffects <- list(c("year", "site"))
# # slopeRandomEffects <- list()
# 
# # Quels sont les effets polynomiaux de degré 2 à considérer ?
# # NULL si pas d'effet polynomial
# # NB : si une variable est renseignée dans l'effet polynomial, elle ne doit pas être mise dans les effets fixes continus
# poly <- c("longitude", "latitude")
# # poly <- c("julian", "longitude", "latitude")
# 
# 
# #####################################
# #   Définir les groupes d'espèces   #
# #####################################
# # A remplir si makeGroupPlot == TRUE
# 
# # Nom du/des groupes d'espèces
# # NULL si toutes les espèces doivent être mises dans le même groupe
# groupNames <- c("Généralistes", "Spécialistes agricoles", "Spécialistes forestiers", "Spécialistes urbains")
# # groupNames <- NULL
# 
# # Composition du/des groupes d'espèces
# # NULL si toutes les espèces doivent être mises dans le même groupe
# # groupComp <- NULL
# groupComp <- list(c("COLPAL", "CUCCAN", "PICVIR", "SYLATR", "FRICOE", "LUSMEG",
#                      "TURMER","PRUMOD", "ORIORI", "PARMAJ", "PARCAE", "CORCOR",
#                      "GARGLA", "HIPPOL"),
# 
#                   c("VANVAN", "BUTBUT", "FALTIN", "ALERUF", "PERPER", "COTCOT",
#                     "UPUEPO", "ALAARV", "LULARB", "GALCRI", "ANTPRA", "ANTCAM",
#                     "MOTFLA", "SYLCOM", "SAXTOR", "SAXRUB", "LANCOL",
#                     "CORFRU", "CARCAN", "EMBCIT", "EMBCIR", "MILCAL", "EMBHOR"), # OENOEN
# 
#                   c("DENMAJ", "DENMED", "DRYMAR", "SYLMEL", "PHYBON",
#                     "PHYSIB", "PHYCOL", "PHYTRO", "REGREG", "REGIGN", "SITEUR",
#                     "CERBRA", "CERFAM", "TROTRO", "TURPHI", "TURVIS", "ERIRUB",
#                     "PARCRI", "PARATE", "PARPAL", "PARMON", "COCCOC", "PYRPYR"), # PICCAN
# 
#                   c("STRDEC", "APUAPU", "DELURB", "HIRRUS", "PHOOCH", "PHOPHO",
#                     "CORMON", "PICPIC", "CARCAR", "CARCHL", "SERSER", "PASDOM",
#                     "PASMON"))
# 
# # Couleurs associées aux groupes
# # NULL si pas de couleurs associées
# groupCols <- c("#1FA3D4","#F3AA20", "#235D3A", "#58094F")
# # groupCols <- NULL
# 



# STEP 0 : CHOOSE PARAMETERS

###########################
#   Paramètres généraux   #
###########################

# Nom du répertoire où les données sont mises (sans caractères spéciaux)
# Exemple : "STOC_2023_Ile_de_France"
repo <- "STOC_Dir_Oiseaux" 

# Nom du jeu de données .csv à charger (sans caractères spéciaux)
# Exemple : "countingData.csv"
Data <- "countingDataFilter.csv"

# Nom de l'observatoire étudié (sans caractères spéciaux)
obs <- "STOC"

# Nom de l'échelle d'observation (sans caractères spéciaux)
# Exemple : "France" ou "Bretagne" ou "ONF" ou ...
spatialScale <- "France"

# Est-ce que les absences (0) doivent être générées par la routine ?
createAbsence <- TRUE # FALSE

# Est-ce que la tendance court-terme doit être réalisée ?
makeShortTrend <- FALSE # FALSE

# Est-ce que le gamm doit être réalisé ?
makeGammTrend <- FALSE #TRUE # FALSE

# Est-ce que les tendances quadratiques doivent être réalisées ?
makeQuadraticTrend <- FALSE # FALSE

# Est-ce qu'un graphe résumé par groupe d'espèces doit être réalisé ?
makeGroupPlot <- FALSE #FALSE

# Est-ce que le pdf doit être créé ?
makePDF <- FALSE # FALSE

###########################
# Optionnel : performance #
###########################

# Les espèces doivent-elles être traitées en parallèle ?
parallelizeSpecies <- TRUE # TRUE

# Si oui, combien de processeurs sont à disposition ?
nbCores <- 24

# Quel est le package à utiliser pour foreach()%dopar%{...} ?
parallelPackage <- "doParallel" # some clusters prefer "doMPI"

#########################
# Formatter les données #
#########################

# Quelles espèces souhaitez-vous analyser ?
# Si NULL, toutes les espèces sont analysées
speciesList <- NULL #c("STRTUR","EMBCIR","EMBCIT","AEGCAU","ANTTRI","CARCAR","CERBRA","CARCHL","CORCOR","DENMAJ","ERIRUB","FRICOE","GARGLA","HIRRUS","CARCAN","LUSMEG","MOTALB","PHYCOL","PICPIC","PICVIR","PRUMOD","SERSER","SITEUR","SYLATR","TROTRO")#NULL #c("EMBCIT","EMBCIR") # c("Tetvir","Leppun","Phogri")

# Quelles sont les dates de début et de fin à prendre en compte ? 
# Si NULL, toutes les années sont utilisées
yearRange <- c(2014, 2023) #c(2001, 2023) #NULL # c(2012, 2023)

##########################
# Construire les modèles #
##########################

# Quelle est la distribution à appliquer ?
# (e.g: gaussian, poisson, nbinom2, binomial, betabinomial)
# Si NULL, la routine la déduit automatiquement
distribution <- NULL

# Quelle est la variable à expliquer ?
interestVar <-  "abondance"   # c("abond_cumul", "fail")

# Quels sont les effets fixes continus / numériques à considérer ?
fixedEffects <-  c("year", "prop_for", "prop_urb", "prop_water", "prop_other", "altitude", "longlat")

# Quelles sont les effets fixes catégoriels à considérer (hors year) ?
# NULL, si pas de variables catégorielles
factorVariables <- c("passage")

# Quel est le niveau de référence pour la variable  ?
# Si NULL, automatiquement mis à la moyenne des années
# Sinon, indiquer un niveau e.g, 2001, 2010, ...
contr <- 'mean'

# Quels sont les effets aléatoires à considérer ?
# NULL si pas d'effets aléatoires simples à considérer
randomEffects <- NULL # c("r_resp")

# Quels sont les effets emboîtés à considérer ?
# list() si pas d'effets emboîtés
# NB : si une variable est renseignée dans l'effet emboîté, elle ne doit pas être mise dans l'effet aléatoire
nestedEffects <- list(c("site", "num_dep"))

# Quels sont les effets de pentes aléatoires à considérer ?
# list() si pas de pentes aléatoires
slopeRandomEffects <- list(c("year", "site"))

# Quels sont les effets polynomiaux de degré 2 à considérer ?
# NULL si pas d'effet polynomial
# NB : si une variable est renseignée dans l'effet polynomial, elle ne doit pas être mise dans les effets fixes continus
poly <- c("longitude", "latitude") 


#####################################
#   Définir les groupes d'espèces   #
#####################################
# A remplir si makeGroupPlot == TRUE

# Nom du/des groupes d'espèces
# NULL si toutes les espèces doivent être mises dans le même groupe
groupNames <- c("Généralistes", "Spécialistes agricoles", "Spécialistes forestiers", "Spécialistes urbains") 

# Composition du/des groupes d'espèces
# NULL si toutes les espèces doivent être mises dans le même groupe
groupComp <- list(c("COLPAL", "CUCCAN", "PICVIR", "SYLATR", "FRICOE", "LUSMEG",
                    "TURMER","PRUMOD", "ORIORI", "PARMAJ", "PARCAE", "CORCOR",
                    "GARGLA", "HIPPOL"),
                  
                  c("VANVAN", "BUTBUT", "FALTIN", "ALERUF", "PERPER", "COTCOT",
                    "UPUEPO", "ALAARV", "LULARB", "GALCRI", "ANTPRA", "ANTCAM",
                    "MOTFLA", "SYLCOM", "SAXTOR", "SAXRUB", "LANCOL",
                    "CORFRU", "CARCAN", "EMBCIT", "EMBCIR", "MILCAL", "EMBHOR"), # OENOEN
                  
                  c("DENMAJ", "DENMED", "DRYMAR", "SYLMEL", "PHYBON",
                    "PHYSIB", "PHYCOL", "PHYTRO", "REGREG", "REGIGN", "SITEUR",
                    "CERBRA", "CERFAM", "TROTRO", "TURPHI", "TURVIS", "ERIRUB",
                    "PARCRI", "PARATE", "PARPAL", "PARMON", "COCCOC", "PYRPYR"), # PICCAN
                  
                  c("STRDEC", "APUAPU", "DELURB", "HIRRUS", "PHOOCH", "PHOPHO",
                    "CORMON", "PICPIC", "CARCAR", "CARCHL", "SERSER", "PASDOM",
                    "PASMON"))

# Couleurs associées aux groupes
# NULL si pas de couleurs associées
groupCols <- c("#1FA3D4","#F3AA20", "#235D3A", "#58094F") 
