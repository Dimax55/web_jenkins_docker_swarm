# Використовуємо офіційний образ Nginx як базовий
FROM nginx:alpine

# Копіюємо файл index.html в директорію, яку Nginx використовує для обслуговування контенту
COPY index.html /usr/share/nginx/html/
