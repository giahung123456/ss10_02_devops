# 1. Base Image: Linux Alpine tối ưu dung lượng cho Node.js
FROM node:18-alpine

# 2. Thư mục làm việc trong container
WORKDIR /app

# 3. Biến môi trường cổng dịch vụ
ENV PORT=3000

# 4. Sao chép định nghĩa phụ thuộc trước để tối ưu hóa Docker Build Cache
COPY package*.json ./

# 5. Cài đặt các thư viện sản phẩm
RUN npm install --only=production

# 6. Sao chép toàn bộ mã nguồn ứng dụng vào WORKDIR
COPY . .

# 7. Khai báo cổng lắng nghe của ứng dụng
EXPOSE 3000

# 8. Lệnh khởi chạy ứng dụng (Exec form)
CMD ["node", "server.js"]