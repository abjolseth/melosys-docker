# melosys-docker
Docker prosjekt to create a docker image med melosys-web og nginx 

Log inn på docker verten med Putty, og WinSCP for kopiere filer.

Se Jira EESSI2-327 "Docker integrasjon setup, konfigurasjon og deploy på test server" for detaljer.

### Hvordan bygge og deploye Docker image
* På docker verten er det laget en katalog "melosys", som inneholder
  * Dockerfile
  * __dist__ katalogen
* _sudo docker images_ liste docker images som er tilgjenglig i docker verten.
* _sudo docker ps -a_ liste running docker instances
* _sudo docker stop CONTAINER ID_  med CONTAINER ID fra _docker ps -a_
* _sudo docker rm CONTAINER ID_
* _sudo docker rmi melosys-web_
* Gå til __"~/melosys"__ katalogen på Docker verten
  * Slett innholdet i __dist__ katalogen
* Bygg melosys-web-proto SPA med _npm run build_ på localhost
  * Benytt WinSCP og kopier innholdet fra build katalogen til __dist__ katalogen
* På Docker verten
  * Stopp og slett currently running docker container
  * Fjern docker image _melosys_web_
  * Bygg nytt Docker image, 
    * _sudo docker build -t melosys-web ._  
  * Sjekk at nytt image er generert med _sudo docker images_
  * Kjør Docker container
    * _sudo docker run --name melosys -d -p 80:80 melosys-web_


