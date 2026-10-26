# Exemple de sauvegarde

`backup.ps1` copie les dossiers indiqués avec les caractéristiques suivantes : chemins explicites, identité d'exécution, absence de mot de passe stocké, erreurs bloquantes et aucune suppression automatique. Le script conserve les copies sans suppression automatique ; la rétention se gère séparément.

```powershell
.\backup.ps1 -Source 'C:\Demo\Documents' -Destination 'D:\DemoBackups' -WhatIf
```

Créer au préalable deux dossiers de test distincts. Après examen du résultat simulé, retirer `-WhatIf` pour copier les fichiers témoins. Pour une destination réseau, le compte exécutant le script doit déjà disposer des permissions nécessaires. Ne pas désactiver les protections d'exécution PowerShell pour le lancer.

Chaque source est copiée sous `source-0`, `source-1`, etc. dans un dossier unique horodaté. Tester ensuite une restauration vers un autre dossier et comparer les fichiers. Ne pas l'utiliser pour des données en cours de modification ni pour sauvegarder l'état système d'un contrôleur de domaine.
