*** Settings *** 
Documentation     Fichiers de scripts pour le module RQ1.BF1.1 Ajouter un utilisateur-NominalEssais
Library    SeleniumLibrary
Variables    ../Ressources/Locators/Locators.py
Resource    ../Ressources/Keywords/Keywords.robot

Suite Setup    Ouvrir le navigateur    ${vURL}    ${vBrowser}
Suite Teardown    Fermer les fenettres
Test Setup    
Test Teardown
Test Template

*** Variables ***
#Ouvrir le navigateur
${vURL}    http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}    chrome
${TIMEOUT}    10
#Formulaire d'inscription
${vFirst_Name}    Mihock
${vLastName}    Dracola
${vEmail}    mihackdraccola@onepiece.qm
${vPhone}    00000000000
${vPassword}    Ba3oooooBa3ooooo
${vNewsletter}    No    #Faut choisir Yes ou No pour l'abonnement au Newslater  
#Recherche de produits
${vProduitRecherche}    Mac
#Passer commande
${vProduitsellectionne}    MacBook
${vFirst_Name}    Mihock
${vLastName}    Dracola
${vAdresse}    44 rue chouhada
${v_City}    Adrar
${vCode_Postale}    A1A2B2
${vMessage}  Please how can I pay   

*** Test Cases ***
######################################$ RQ2.BF3.1.CT1 Passer premiere commande-Nominal $######################################
Préconditions
    S'inscrire    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}

Cas de test
    Passer une commande    ${vProduitRecherche}    ${vProduitsellectionne}    ${vFirst_Name}    ${vLast_Name}    ${vAdresse}    
    ...                    ${v_City}    ${vCode_Postale}    ${vMessage}
# Critères de succès
    #Integrer dans le cas de test
    
Postconditions
    Logout

    
    
    

