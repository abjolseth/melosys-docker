FROM docker.adeo.no:5000/lib/nginx:1.13.5
COPY dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]