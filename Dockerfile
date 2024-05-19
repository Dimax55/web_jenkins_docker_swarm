# Використовуємо офіційний образ Nginx як базовий
FROM nginx:alpine

# Копіюємо файл index.html в директорію, яку Nginx використовує для обслуговування контенту
RUN echo "
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello</title>
</head>
<body>
    <h1>Hello, this Dima`s test </h1>
</body>
</html> " >/usr/share/nginx/html/index.html
