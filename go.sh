#!/bin/bash

# Chemin vers le CSV du RNE agrégé par Koumoul
rne=/media/colin/data/rne/Repertoire-national-des-elus.csv

# Chemin vers le CSV des candidats agrégé par Christian Quest
candidats=/media/colin/data/municipales2020/mn2020-candidats.csv

while IFS=, read -r departement_num departement_nom commune_code commune_nom num_panneau liste_courte liste_etendu nuance num sexe nom prenom nationalite candidat_conseil_comm
do
    if [[ ! "$departement_num" == "Code du département" ]]
    then
        echo $prenom
        echo $nom
        echo $nuance
        echo ""
    fi
done < $candidats
