# Validation de l'import

Import préparé le 26 octobre 2026. Seul le commit initial existant du dépôt cible est conservé ; aucun historique des sources n'est repris.

Sources sélectionnées par liste autorisée. Secrets locaux, états, sauvegardes, exports personnels, environnements virtuels, exécutables et documents bruts exclus. Les fichiers publiés ont été examinés avant commit.

Les contrôles propres au projet sont précisés dans le compte rendu d'import ; aucune recette de production ou sur serveur Discord n'est revendiquée.

## Contrôles effectués

Syntaxe PowerShell analysée sans erreur ; simulation `-WhatIf` sur des dossiers de test réussie. Liens et documentation vérifiés. Les VM sont absentes : aucune recette réseau ni restauration réelle exécutée.

Recherche automatique sans alerte des formats de tokens courants, clés privées, webhooks, adresses e-mail et identifiants Discord réels dans les fichiers texte sélectionnés. Cette recherche complète la sélection manuelle ; elle ne garantit pas la détection de tout secret imaginable.
