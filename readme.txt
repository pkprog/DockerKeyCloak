Их этой папки:
docker build -t pavelk/kctest:v2 .
или не из этой
docker build -t pavelk/kctest:v5 ~/WebstormProjects/dockerKeyCloak1/

()
Запуск:
docker run -d --name=kk -p 8080:8080 pavelk/kctest:v5

подождать и создать админа
docker exec kk /etc/keycloak/keycloak-16.1.0/bin/add-user-keycloak.sh -u admin -p admin

перезапустить контейнер
docker restart kk
