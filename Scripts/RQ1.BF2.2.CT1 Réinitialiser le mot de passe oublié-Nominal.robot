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
${vFirst_Name}    Garp
${vLastName}    Mounkey.D
${vEmail}    mounkey.d_garp@qonepiece.mr
${vPhone}    6666666666
${vPassword}    MarineMarine
${vNewsletter}    Yes    #Faut choisir Yes ou No pour l'abonnement au Newslater  
#Renisialisation du password
${vNew_Password}    PiretesPirates
 

*** Test Cases ***
###########################################$ RQ1.BF1.1.CT1 Se connecter-Nominal $#########################################
Préconditions
    S'inscrire    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}

Cas de test
    Initialiser le mot de passe    ${vNew_Password}
# Critères de succès
    #Integrer dans le cas de test
    
Postconditions
    Logout

    
    
    

