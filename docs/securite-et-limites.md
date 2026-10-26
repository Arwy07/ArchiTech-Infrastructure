# Sécurité et limites

## Nettoyage de la publication

Les mots de passe, tableaux d'identifiants, noms d'étudiants, captures et annexes brutes ont été écartés. Aucun historique ancien ni export pfSense/Active Directory n'est importé. Si les anciens mots de passe sont encore utilisés, les remplacer dans l'environnement concerné.

## Écarts à traiter avant une remise en service

- Les règles pfSense historiques autorisent « Any vers Any ». Elles ne démontrent pas une isolation entre segments. Construire des règles limitées aux flux nécessaires, puis tester les refus.
- La politique de mots de passe documentée est un état historique, sans garantie de conformité actuelle. Revoir les comptes privilégiés, les accès distants et les stratégies.
- Le script d'origine stockait un mot de passe en clair et utilisait un compte administrateur. L'exemple publié utilise l'identité d'exécution et doit disposer de droits limités sur une destination de test.
- Une copie de dossiers ne garantit pas une sauvegarde cohérente d'Active Directory, d'une base de données ou d'un serveur entier. Prévoir des mécanismes adaptés et des restaurations testées.
- Les VM étant absentes, aucune règle, GPO, jointure de domaine ni restauration n'a été vérifiée à nouveau.
