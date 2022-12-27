*** Settings *** 
Documentation     Fichiers de scripts pour le module RQ1.BF1.1 Ajouter un utilisateur-Nominal
Library    SeleniumLibrary
Library    DataDriver    ../Ressources/Datapool/ysdatapool.csv
Variables    ../Ressources/Locators/Locators.py
Resource    ../Ressources/Keywords/Keywords.robot


Suite Setup    Ouvrir le navigateur    ${vURL}    ${vBrowser}
Suite Teardown    Fermer les fenettres
Test Setup    
Test Teardown    
Test Template    S'inscrire

*** Variables ***
#LogIn
${vURL}    http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}    chrome
${TIMEOUT}    7s

*** Test Cases ***    FirstName    LastName    EMail    Telephone    Password    Newsletter
Test RQ1.BF1.1 Ajouter un utilisateur(Datadreaven)-Nominal    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}
...                                                        ${vPassword}    ${vNewsletter}

*** Keywords ***
S'inscrire
    [Documentation]    Ce keyword permet de creer un nouveau utilisateur
    [Arguments]    ${vFirst_Name}    ${vLastName}    ${vEmail}    ${vPhone}    ${vPassword}    ${vNewsletter}
    # vFirst_Name contient le Prenom
    # vLastName contient le Nom
    # vEmail contient le courriel
    # vPhone contient le lnumero de telephone
    # vPassword contient le mot de passe
    # vNewsletter contient sou Yes ou No pour choisir entre s'abonner ou non a la Newslater

    # Ouvrir le menu My Account
    Click Element    ${elmnt_My_Account}
    # Cliquer sur l'option Register
    Click Element    ${link_Register}
    #Remplire le formulaire d'enregistrement
    # Saisir Prenom
    Input text    ${txtFirstName}    ${vFirst_Name}
    # Saisir Nom
    Input text    ${txt_Last_Name}    ${vLastName}
    # Saisir Email
    Input text    ${txt_Email}    ${vEmail}
    # Saisir Telephone
    Input text    ${txt_Telephone}    ${vPhone}
    # Saisir assword
    Input text    ${txt_Password}    ${vPassword}
    # Saisir assword Confirm
    Input text    ${txt_Password_Confirm}    ${vPassword}
    # Condition pour le choix entre s'abonner ou non a la Newslater
    # Il faut initialiser la variable "vNewsletter" soit Yes ou No
    IF    '${vNewsletter}' == 'Yes'
        Click Element    ${radio_Yes}
    END
    # Cocher la case de Privacy Policy 
    Click Element   ${checkbox_Privacy_Policy}
    # Click sur le bouton Continue pour creer le compte
    Click Element   ${btn_Continue1}
    # Click sur le bouton Continue pour acceder au tableu de bord du nouveau compte
    Click Link   ${btn_Continue2}
#Criteres de succès & Postconditions
    Critere de succès et Postconditions pour RQ1.BF1.1    ${vEmail}    ${vPassword}
