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
${vFirst_Name}    Borog3i
${vLastName}    Oualid
${vEmail}    oualadborog3i@emoughrib.mr
${vPhone}    067894156
${vPassword}    FinEl3assaye
${vNewsletter}    No    #Faut choisir Yes ou No pour l'abonnement au Newslater 

*** Test Cases ***
###########################################$ RQ1.BF2.1.CT1 Se connecter-Nominal $#########################################
Préconditions
    S'inscrire    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}
    Logout

Cas de test
    Login    ${vEmail}    ${vPassword}
# Critères de succès
    #Integrer dans le cas de test
    
Postconditions
    Logout

    
    
    

