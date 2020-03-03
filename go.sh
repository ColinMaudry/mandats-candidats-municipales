#!/bin/bash

# Chemin vers le CSV du RNE agrégé par Koumoul
rne=/media/colin/data/rne/Repertoire-national-des-elus.csv

# Chemin vers le CSV des candidats agrégé par Christian Quest
candidats=/media/colin/data/municipales2020/mn2020-candidats.csv

matchs=0
line=0
lines=`tail -n +2 $candidats | wc -l`


while IFS=, read -r departement_num departement_nom commune_code commune_nom num_panneau liste_courte liste_etendu nuance num sexe nom prenom nationalite candidat_conseil_comm
do

    if [[ ! "$departement_num" == "Code du département" ]]
    then
        ((line++))
        pourcent=$((line / lines * 100))
        echo "$pourcent %"


        prenomnom="$prenom$nom"
        echo $ligne

        while IFS=, read -r nom_rne prenom_rne sexe_rne date_naissance code_pro libelle_pro age conseiller_municipal conseiller_communautaire conseiller_departemental conseiller_regional conseiller_assemblee_corse representant_parlement_euro senateur depute maire nb_mandats fonctions nb_fonctions id
        do
            if [[ "$prenomnom" == "$prenom_rne$nom_rne" ]]
            then
                ((matchs++))
                echo "$ligne,$date_naissance,$code_pro,$libelle_pro,$age,$conseiller_municipal,$conseiller_communautaire,$conseiller_departemental,$conseiller_regional,$conseiller_assemblee_corse,$representant_parlement_euro,$senateur,$depute,$maire,$nb_mandats,$fonctions,$nb_fonctions,$id" >> candidats_plus_rne.csv
            fi
        done < $rne

    fi
done < $candidats

echo "$matches correspondances"
