# Використовуємо офіційний образ Nginx як базовий
FROM nginx:alpine

# Копіюємо файл index.html в директорію, яку Nginx використовує для обслуговування контенту
RUN echo "<h1>Hello, this Dima`s test </h1>" >> /usr/share/nginx/html/index.html
