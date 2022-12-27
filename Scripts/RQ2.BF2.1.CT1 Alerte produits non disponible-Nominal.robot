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
#Se connecter
${vEmail}    gol.d_roger@onepiece.pi  
${vPassword}    GomoGomoNooooo  
#Recherche de produits
${vProduit}    Mak
*** Test Cases ***
####################################$ RQ2.BF2.1.CT1 Alerte produits non disponible-Nominal $##############################
Préconditions
    Login    ${vEmail}    ${vPassword}

Cas de test
    Alerte produits non disponible    ${vProduit}

# Critères de succès
    #Integrer dans le cas de test
    
Postconditions
    Logout

    
    
    

