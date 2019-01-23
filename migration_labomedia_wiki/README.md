# Modification de l'archive wiki.labomedia.org

* Modifier les liens vers index.html to index2.html
* Suppression des liens morts :
  * https://wiki.labomedia.org/index.php/Spécial:Préférences 
  * https://wiki.labomedia.org/index.php/Centre_de_Ressources_Numériques_-_Labomedia:Avertissements_généraux

* Changer le bandeau indiquant le status de l'archive
* Changer la colone de gauche
* Identifier et copier les resources statiques manquantes pour les pages qui ne sont pas dans le repertoire index.php

# Suppression / modification des liens
Pour les suppressions, un replace des anchor par &nbsp; devrait suffir.
Pour le modifications, un replace suffira.

# Changement du bandeau
Remplacer '<html><body><table class="wikitable">' ... '</table></body></html>' inclue par le nouveau bandeau. Ajouter des espaces optionnels entre les balises. Exclure la balise </table> pour le contenu wildcard à remplacer.

# Changement de la colone de gauche
Remplacer '<div id="mw-panel">' ... '<div id="footer" role="contentinfo">' exclue par la nouvelle colone.
