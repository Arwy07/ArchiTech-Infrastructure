# Exemple de sauvegarde

`backup.ps1` est une adaptation du principe de copie du dossier technique : chemins explicites, identité d'exécution, absence de mot de passe stocké, erreurs bloquantes et aucune suppression automatique. La rétention historique de sept jours n'est pas implémentée dans cette version de démonstration.

```powershell
.\backup.ps1 -Source 'C:\Demo\Documents' -Destination 'D:\DemoBackups' -WhatIf
```

Créer au préalable deux dossiers de test distincts. Après examen du résultat simulé, retirer `-WhatIf` pour copier les fichiers témoins. Pour une destination réseau, le compte exécutant le script doit déjà disposer des permissions nécessaires. Ne pas désactiver les protections d'exécution PowerShell pour le lancer.

Chaque source est copiée sous `source-0`, `source-1`, etc. dans un dossier unique horodaté. Tester ensuite une restauration vers un autre dossier et comparer les fichiers. Ne pas l'utiliser pour des données en cours de modification ni pour sauvegarder l'état système d'un contrôleur de domaine.

La syntaxe a été analysée localement et une simulation avec `-WhatIf` a été exécutée. Aucune sauvegarde réelle de l'infrastructure n'a été effectuée ; les VM sont absentes.
