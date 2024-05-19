# Використовуємо офіційний образ Nginx як базовий
FROM nginx:alpine

# Копіюємо файл index.html в директорію, яку Nginx використовує для обслуговування контенту
RUN touch /usr/share/nginx/html/1.txt
