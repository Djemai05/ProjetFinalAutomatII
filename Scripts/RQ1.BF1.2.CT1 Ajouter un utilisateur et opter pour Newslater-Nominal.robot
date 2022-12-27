*** Settings *** 
Documentation     Fichiers de scripts pour le module RQ6 : Outils Admin.
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
${vFirst_Name}    Gol.D
${vLastName}    Roger
${vEmail}    gol.d_roger@qonepiece.qm
${vPhone}    66666666
${vPassword}    GomoGomoNooooo
${vNewsletter}    Yes    #Faut choisir Yes ou No pour l'abonnement au Newslater  

*** Test Cases ***
#########################$ RQ1.BF1.2.CT1 Ajouter un utilisateur et opter pour Newslater-Nominal $###########################
# Préconditions
    # Pas de precondition a part l'ouverture du navigateur et l'acces au site

Cas de test
    S'inscrire    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}

# Critères de succès
    #Integrer dans le cas de test
    
Postconditions
    Logout

    
    
    

