# ใช้ Nginx Image จาก Docker Hub
FROM nginx:alpine

# คัดลอกไฟล์ HTML ไปที่ directory ที่ Nginx ใช้
COPY index.html /usr/share/nginx/html/index.html
