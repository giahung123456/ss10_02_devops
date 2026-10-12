# Bài tập 2: Đóng gói Web Backend với Single-stage Dockerfile

## Mô tả
Dự án REST API đơn giản viết bằng Node.js/Express, được đóng gói trong một Single-stage Dockerfile dựa trên nền `node:18-alpine`.

## Hướng dẫn thực thi

### 1. Build Docker Image
```bash
docker build -t hw-backend:v1 .
2. Chạy Container
Bash
docker run -d --name app-single-stage -p 8080:3000 hw-backend:v1
3. Kiểm tra trạng thái và logs
Bash
# Kiểm tra container đang chạy
docker ps

# Kiểm tra log ứng dụng
docker logs app-single-stage
4. Kiểm tra phản hồi API
Bash
curl -i http://localhost:8080/
5. Dọn dẹp môi trường
Bash
docker stop app-single-stage
docker rm app-single-stage

---

### 3. Quy trình thực thi và kết quả kiểm tra

<Sequence>
  <Step title="Build Docker Image">
    Chạy lệnh build tại thư mục chứa mã nguồn:
    ```bash
    docker build -t hw-backend:v1 .
    ```
    Docker sẽ tải base image `node:18-alpine`, tạo thư mục `/app`, chạy `npm install` và đóng gói mã nguồn thành image `hw-backend:v1`.
  </Step>

  <Step title="Khởi chạy Container với Port Mapping">
    Chạy container ở chế độ nền (detached) và ánh xạ port `8080` của máy host vào port `3000` của container:
    ```bash
    docker run -d --name app-single-stage -p 8080:3000 hw-backend:v1
    ```
  </Step>

  <Step title="Xác minh Container và Kiểm tra Log">
    Xác minh container có trạng thái `Up` và ứng dụng đã lắng nghe cổng:
    ```bash
    docker ps
    docker logs app-single-stage
    ```
    *Đầu ra mong đợi của logs:* `Server listening on port 3000`.
  </Step>

  <Step title="Gửi yêu cầu HTTP kiểm tra">
    Gửi request đến cổng `8080` của host:
    ```bash
    curl -i http://localhost:8080/
    ```
    *Đầu ra mong đợi:*
    ```http
    HTTP/1.1 200 OK
    Content-Type: application/json; charset=utf-8
    Content-Length: 61
    ...

    {"status":"success","message":"Hello from Docker Single-stage!"}
    ```
  </Step>
</Sequence>

<FollowUp label="Bạn có muốn chuyển đổi sang Multi-stage Dockerfile để tối ưu dung lượng và bả