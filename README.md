*Carcassonne Immo*
------------------

This is a Symfony project with defined categories and adverts for houses.
This is either for Location and Sale proposals.

Powered with **PHP, MySQL, Symfony 3, Bootstrap 4, Easyadmin, Vichuploader, FOSUserBundle**.

There's a some testing datas already included in the **dump.sql**

Simply dump the sql into a new database to enjoy !

You have to do the dump before trying to access to **/admin**.

You can't use **/register** because **fos_user** routing is set to **security.xml**.
To create new users that can access to the **EasyAdmin** backoffice, you have to create them in it first.

First logins are :
    - user : *admin*
    - pwd : *test*
    
Site is composed as following :
    - *index* : automatic routing to **/annonces**
    - */annonces* : list of all adverts where you can access more further by clicking on the title (**/annonce/{id}**), number of rooms and price
    - */annonce/{id}* : Detailed advert of the sale/location.
    - A search input that is searching by titles and advert's Type (Vente/Location at start)
    - */admin* : EasyAdmin backoffice to manipulate data (Clients, Users, Adverts, Advert's Types)
    - */login* : If you go */admin* directly, you're redirected there.