## TP CICD
## Martinez Romain | Mullet Florent | Heumel Léo

Nous avons choisi le projet simple astro afin de nous focaliser sur le deploiement de chaque outils que nous allons vous présenter.

# JenkinsFile

Nous avons mis en place le projet sur jenkins avec le gitHub du projet et le JenkinsFile.
# Nexus

Après avoir lancé le package Maven nous avons mis en place le kenkins afin de commencer l'integration continue.

Nous avons decidé de nous concentrer sur le deploiement du projet maven sur nexus afin d'avoir les traces d'artefacts.
Pour cela nous avons modifier le pom.xml afin d'y ajouter le s bon plugin et le distributionManagement. Nous avons de même créé le fichier settings.xml pour pouvoir se connecter à Nexus.

Lors de l'execution de mvn deploy nous obtenons cette erreur :  
Failed to deploy artifacts: Could not transfer artifact com.bradsbrain:SimpleAstronomyLib:jar:sources:0.3.0 from/to nexus-releases (http://localhost:8081/repository/maven-releases): Transfer failed for http://localhost:8081/repository/maven-releases/com/bradsbrain/SimpleAstronomyLib/0.3.0/SimpleAstronomyLib-0.3.0-sources.jar 401 Unauthorized 

Nous n'avons aucun mal à nous connecter à Nexus manuellement pourtant, 401 Unauthorized survient lors d'un mot de passe erroné.

#Docker

Nous avons mis en place un Github action qui permet de déployer une image docker du projet ainsi que d'executer un mvn package.
A chaque push sur la branch main, le Github action est lancé.
Ce dernier lance un build d'une image docker a chaque push sur la branche main.
Pour le mvn package, nous avons créé un Dockerfile qui crée un calque à partir de l'image Docker maven:3.8-openjdk-17
et qui execute un mvn package.
Au départ, nous avions choisi de faire un déploiement en local mais nous avons rencontré pas mal de problèmes donc
nous avons choisi de le faire directement sur Github.