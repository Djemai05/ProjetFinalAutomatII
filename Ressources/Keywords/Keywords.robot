*** Settings ***
Documentation     Ce fichier contien les Keywords des cas de tests
Library    SeleniumLibrary
Library    XML
Variables    ../Locators/Locators.py

*** Variables *** 
${TIMEOUT}    30s   

*** Keywords *** 
    
    #Set Selenium Timeout    30
    Set Selenium Implicit Wait    5

Ouvrir le navigateur
    [Documentation]    Ce keyword permet d'ouvrir le navigateur et d'acceder a l'appli web a tester
    [Arguments]    ${vURL}    ${vBrowser}
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # Ouvrir le navigateur en precisant l'URL et le navigateur et la langue
    Open Browser    ${vURL}    ${vBrowser}    options=add_argument('--lang=fr')  
    # Maximiser la fenetre du navigateur
    Maximize Browser Window


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



Critere de succes (RQ1.BF1.1.CT1 Ajouter un utilisateur en double-Exeption)
    [Documentation]    Ce keyword permet de verifier le reffu de creation d'un compte en double
    #Il faut s'assurer que le systeme reffuse de creer le compte et il affice 
    # ... le messahe d'erreur suivant:  Warning: You must agree to the Privacy Policy!
    ${error_Message}    Get Text    ${lbl_Message_Erreur}
    Should Be Equal    ${error_Message}    Warning: E-Mail Address is already registered!
    


Login        
    [Documentation]    Ce keyword permet de se connecter a l'application à tester
    [Arguments]    ${vEmail}    ${vPassword}
    # vUsername contient le login
    # vPassword contient le mot de passe
    
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le menu My Account
    Click Element    ${elmnt_My_Account}
    # Ouvrir le lien Login
    Click Element    ${link_Login}
    # Saisie du courriel de connection
    Input text    ${txt_E_Mail_Address}    ${vEmail}
    # Saisie du mot de passe    
    Input Password    ${txt_Password}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button    ${btn_Login}
    # S'assurer que la page est chargee en localisant le lien Logout
    Wait Until Element Is Visible    ${link_Logout_In_Dashbord}
    Element Should Contain     ${link_Logout_In_Dashbord}    Logout
    


Initialiser le mot de passe    
    [Documentation]    Ce keyword permet d'initialiser le mot de passe
    [Arguments]    ${vNew_Password}
    # vNew_Password qui contien le nouveau mot de pass
    # Cliquer sur le lien changer your password
    Wait Until Element Is Enabled    ${link_Change_your_Password}
    click element    ${link_Change_your_Password}
    # Saisir le nouveau mot de pass
    Input Password    ${txt_new_Password}    ${vNew_Password}
    # Confirmer le nouveau mot de pass
    Input Password    ${txt_NewPassword_confirm}    ${vNew_Password}
    # Cliquer sur le boutton Continue
    click element    ${bttn_Continue}
# Critér de succé
    # la page doit afficher un message de confirmation de changement de password
    Page Should Contain     Success: Your password has been successfully updated.



Recherche de produits    
    [Documentation]    Ce keyword permet de chercher des produits sur le site
    [Arguments]    ${vProduitRecherche}
    # vProduit Contien le nom ou la marque du produit a chercher
    # Effacer le contenue du champ de recherche
    Clear Element Text    ${txt_Recherche}
    # Taper le mot a rechercher
    Input Text    ${txt_Recherche}    ${vProduitRecherche}
    # Cliquer sur le bouton de recgercge
    Click Button    ${btn_Recherche}
    # Criteres de secces
    #Sassurer de l'affichege du lien pour comparer les produit
    Wait Until Element Is Visible    ${link_Prodact_Compar}
    Element Should Be Visible    ${link_Prodact_Compar}



Passer une commande
    [Documentation]    Ce keyword permet de passer une commande
    [Arguments]    ${vProduitRecherche}    ${vProduitsellectionne}    ${vFirst_Name}    ${vLast_Name}    ${vAdresse}    ${v_City}    ${vCode_Postale}    ${vMessage}      
    # vProduit_Exciste contient le nom du produit a acheter
    # vFirst_Name contient le nom de l'utilisateur dans la facture
    # vLast_Name contient le prenom de l'etulisateur dans la facture
    # vAdresse contient l'adresse de la facture
    # v_City contient la vile de l'adresse dans la facture
    # vCode_Postale contien le code postale
    # vMessage contient le message a saisir pour l'administrateur
    
    # Appeller le Kewyword Recherche de produits pour faire la recherche du produit a acheter
    Recherche de produits    ${vProduitRecherche}
    # cliquer sur le lien du produit a acheter
    Click Element    ${produit_Selectionné1}${vProduitsellectionne}${produit_Selectionné2}
    # cliquer sur le botton Add to cart
    Click Element    ${btn_Add_To_Cart}
    # Cliquer sur le lien panier
    Click Element    ${link_Panier}
    #Attendre la visibilite de localisateur de lien checkout 
    Wait Until Element Is Visible    ${link_Checkout}
    # cliquer sur le lien checkout
    Click Element    ${link_Checkout}
    #Attendre la visibilite du champs First name du formulaire
    Wait Until Element Is Visible    ${txt_champs_First_Name}
    # saisir First Name
    Input Text    ${txt_champs_First_Name}    ${vFirst_Name}
    # Saisir Last Name
    Input Text    ${txt_champs_Last_Name}    ${vLast_Name}
    # Saisir l'adresse de la facturation
    Input Text    ${txt_champs_Address_1}    ${vAdresse}
    # Saisir la ville
    Input Text    ${txt_champs_City}    ${v_City}
    # Saisir le code postal
    Input Text    ${txt_champs_Post_Code}    ${vCode_Postale}
    # Cliquer sur lien du pays dans la liste
    Click Element    ${link_Country}
    # Choisir le pays dans la liste
    Click Element    ${link_choice_country}
    # Cliquer sur le lien de la region dans la liste
    Click Element    ${link_Region_State}
    #Attendre la visibilite de localisateur de la region a choisir
     Wait Until Element Is Visible    ${link_Choice_Region_State}
    #  Choisir la region dans la liste
    Click Element    ${link_Choice_Region_State}
    # Cliquer sur le boutton continue
    Click Element    ${btn_Continue_payment_Adresse}
    # Choisir la region
    Click Element    ${link_Choice_Region_State}
    # Cliquer sur le boutton Continue
    Click Element    ${btn_Continue_Billing_Detail}
    #Attendre la visibilite de localisateur de lien contact us
    Wait Until Element Is Visible    ${link_contact_us}
    # Cliquer sur le lien contact us
    Click Element    ${link_contact_us}
    # Saisir un message à l'administration de site pour demande l'aide comment payer car 
    # ...le site noffre pas la possibilité de payer pour finaliser l'achat
    Input Text    ${txt_Equiry}    ${vMessage}
    # Cliquer sur le boutton submit pour envoyer le message
    Click Element    ${btn_Submit}




Alerte produits non disponible
    [Documentation]    Ce keyword permet de chercher un produit dans le site
    [Arguments]    ${vProduit}
    # vProduit Contien le nom ou la marque du produit a chercher

    # vider le champs de la barre de recherche
    Clear Element Text    ${txt_Recherche} 
    # Saisir le nom de produit   
    Input text    ${txt_Recherche}    ${vProduit}
    # Cliquer sur le Boutton de recherche
    Click Button    ${btn_Recherche}
    # Critér de succé
    # la page doit afficher un message d'avertissant l'utilisateur que le produit n'exciste pas
    Page Should Contain    There is no product that matches the search criteria.



Logout
    Wait Until Element Is Visible    ${elmnt_My_Account}
    Click Element    ${elmnt_My_Account}
    Wait Until Element Is Visible    ${link_Logout}
    Click Element    ${link_Logout}
    Click Element    ${btn_Continue_Logout}



Fermer les fenettres
    [Documentation]    Ce keyword permet de fermer tout les navigateurs ouverts
    #Fermer toutes les fenetres
    Close All Browsers


Critere de succès et Postconditions pour RQ1.BF1.1    
    [Arguments]    ${vEmail}    ${vPassword}
    Logout
    Login    ${vEmail}    ${vPassword}
    Logout
















































