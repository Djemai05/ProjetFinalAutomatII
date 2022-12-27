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
${vFirst_Name}    Nrjs
${vLastName}    Bndr
${vEmail}    narjasbndr@djarbat.tn
${vPhone}    00000000000000
${vPassword}    WakahouWakahou
${vNewsletter}    No    #Faut choisir Yes ou No pour l'abonnement au Newslater

*** Test Cases ***
#################################$ RQ1.BF1.2.CT1 Ajouter un utilisateur en double-Exeption $##############################
Préconditions
    S'inscrire    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}
    Logout

Cas de test
    S'inscrire    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}

Critères de succès
    Critere de succes (RQ1.BF1.1.CT1 Ajouter un utilisateur en double-Exeption)
    
#Postconditions
    #Pas de posteconditions
    

    
    
    

