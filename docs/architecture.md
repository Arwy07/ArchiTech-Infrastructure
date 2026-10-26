# Architecture du laboratoire

Le dossier décrit pfSense CE 2.7 et Windows Server 2022 dans VirtualBox. Ces versions sont celles du projet d'origine ; leur état de maintenance n'est pas évalué ici.

| Segment logique | Réseau de laboratoire | Passerelle | Usage |
|---|---|---|---|
| 10 | 192.168.1.0/24 | 192.168.1.1 | Clients |
| 20 | 192.168.2.0/24 | 192.168.2.1 | Serveurs |
| 30 | 192.168.3.0/24 | 192.168.3.1 | Administration |

Les adresses privées ci-dessus sont celles du scénario fictif. SRV1 utilise 192.168.2.10 ; SRV-BACK utilise 192.168.2.20. Le domaine de laboratoire est `architect.local`. Le DHCP est fourni par SRV1 au segment client via un relais pfSense. Les clients utilisent le DNS du domaine.

Le dossier appelle ces segments « VLAN », mais décrit aussi des interfaces/réseaux VirtualBox séparés. Aucun export ne permet de vérifier un trunk 802.1Q ; le schéma représente donc des segments logiques et non un déploiement VLAN certifié.

## Reconstruction à préparer

1. Créer des réseaux isolés clients, serveurs et administration ; associer explicitement chaque interface.
2. Déployer le pare-feu et affecter les passerelles sans conflit d'adresse avec l'hôte.
3. Installer SRV1 et ses rôles ; configurer DNS, domaine et DHCP.
4. Définir les groupes et droits sur les partages ; créer uniquement des comptes de démonstration.
5. Joindre les clients au domaine et appliquer les politiques de groupe.
6. Préparer SRV-BACK, un compte dédié à la sauvegarde et un essai de restauration.
7. Appliquer un filtrage explicite et rejouer la recette positive et négative.

Le dossier source donne des numéros de réseaux VirtualBox incohérents et des adresses hôte pouvant chevaucher les passerelles. Ils doivent être résolus lors de la reconstruction, sans reproduire aveuglément les captures historiques.
