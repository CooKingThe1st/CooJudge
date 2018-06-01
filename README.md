# CooJudge
Hướng dẫn dùng CooJudge

ví dụ ta có các bài cần chấm là A.cpp B.cpp và có bộ test
bộ test được định dạng như sau
A/testxx/A.inp và A/testxx/A.out
(nôm na là trong folder tên A, có 1 đống các file test như là  test01 test02, trong test01 có A.inp và A.out)

một số lưu ý trước khi chấm bài
1. tất cả đều là standard input và standard output ( mình 0 rảnh làm file )
2. phải cài pv trước ( sudo apt install pv)
3. phải có endline ở cuối bài
4. TBA

Setup
tạo thư mục mới là abcd(tên 0 quan trọng)
trong abcd, tạo các thư mục Submit và Test ( đúng y chang thế này )
bỏ A.cpp B.cpp vào thư mục Submit
bỏ folder A, B vào Test
bỏ main.sh và judge.sh vào abcd
chạy terminal, cd vào abcd
chạy lệnh $ chmod +x main.sh
chạy lệnh $ ./main.sh để bắt đầu chấm bài

Cách chấm
chỉ việc nhập time limit khi máy hỏi là xong

Kết quả
trình chấm sẽ tạo folder Result chứa kết quả chấm cho từng bài
