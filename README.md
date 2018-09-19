# CooJudge
### Hướng dẫn dùng CooJudge

> Một số thuât ngữ:  
> [định dạng input] : chỉ các file có đuôi là .inp, .INP, .in hoặc .IN  
> [định dạng output] : chỉ các file có đuôi là .out, .OUT  
> [định dạng kết quả] : chỉ các file có đuôi là .ans, .ANS

**Ví dụ** ta có các bài cần chấm là A.cpp B.cpp và có bộ test
    bộ test được định dạng như sau
    A/testxx/A.[định dạng input] và A/testxx/A.[định dạng output hoặc kết quả]
    _(nôm na là trong folder tên A, có 1 đống các file test ví dụ như là test01 test02, trong test01 có A.inp và A.out)_

#### Một số lưu ý trước khi chấm bài
1. tất cả các file nộp bài đều  **standard input** và **standard output**
2. phải cài pv trước ( sudo apt install pv)
3. phải có endline ở cuối bài
4. tên file submit, tên file test, tên từng test phải giống nhau ( case sensitve )  

#### Setup
1. tạo thư mục mới để chấm bài, ví dụ là _abcd_
2. trong _abcd_, tạo các thư mục Submit và Test ( tên bắt buộc phải như thế này )  
    bỏ A.cpp B.cpp vào thư mục Submit  
    bỏ folder A, B vào Test  
    bỏ main.sh và judge.sh vào _abcd_
3. chạy terminal, cd vào thư mục _abcd_
4. chạy lệnh $ chmod +x main.sh rồi chạy lệnh $ ./main.sh để bắt đầu chấm bài  
   hoặc là chạy $ bash main.sh để chấm bài

#### Cách chấm
chỉ việc nhập time limit khi máy hỏi là xong

#### Kết quả
trình chấm sẽ tạo folder Result chứa kết quả chấm cho từng bài

 
#### Screenshot:
0. thư mục nơi ta sẽ chấm bài:
 [folder_main](https://imgur.com/a/S0noplu)  
 chỉ cần quan tâm 2 thư mục Submit và Test
1. thư mục nạp bài: [Submit](https://imgur.com/a/I2IcW3e)
2. thư mục chứa test: [Test](https://imgur.com/a/MoJs9UJ)
3. chạy trình chấm: [Run](https://imgur.com/a/Dj6XQxI)


    ---------------------------------------------------------

### Từ beta 1.0.9

**Thêm các tính năng:**

1. Đã có thông báo cho các lệnh exitcode  
2. Sửa màu cho các icon
3. Fixed Bug

#### Note:

Để biết exitcode thể hiện cái gì, ta lấy _x = exitcode - 128_, rồi soi vào đây: [Exit Code](http://man7.org/linux/man-pages/man7/signal.7.html)  
**VD**: _exitcode 139_, thì sẽ là lỗi số 11, tức là SIGSEGV, hay ta còn gọi là segmentaion fault.
 
#### Một số exit code hay gặp:

* 3  : stack memory exceed  
* 128: timeout
* 134: assert failed
* 139: segment fault

    --------------------

### Từ beta 1.1.0

**Thêm các tính năng**

1. CustomJudge  
Hỗ trợ việc chấm cho các bài yêu cầu trình chấm ngoài (**LINUX** only)
2. Đã hỗ trợ cho các format input output khác  
 **.inp, .INP, .in, .IN** với input  
 **.out, .OUT, .ans, .ANS** với output

#### Cách dùng trình chấm ngoài:

Trong folder chứa testcase, ví dụ là ABC (trong ABC có chứa test01, test02), ta thêm file checker vào  
Trong đó, checker sẽ đọc từ testxx/ABC.[định dạng input] và nếu cần thì thêm testxx/ABC.[định dạng kết quả]
**Lưu ý** folder testxx không được chứa file.[định dạng output] trong bất cứ trường hợp nào

#### Yêu cầu về checker

Output của checker gồm ít nhất 2 dòng trong đó:
* dòng 1 gồm **1 số duy nhất** chứa điểm của thí sinh, có thể là số thực hoặc số nguyên
* dòng 2 trở đi là thông tin do checker gửi về  
ví dụ sai vì cái gì, thiếu cái gì

#### Demo Screenshot for CustomJudge
1. Thư mục nơi ta chấm bài [Main Folder](https://imgur.com/a/c2WvSSd)
2. Thư mục nộp bài [Submit] (https://imgur.com/a/RVaHDqN) có chứa bài làm của user cho problem Tab
3. Thư mục Test: [Test](https://imgur.com/a/AFccPKs)  có chứa 1 folder test Tab  
 trong Tab: [Inside Tab](https://imgur.com/a/j8T3gPl) có chứa 1 folder testxx và 1 file checker
4. Chạy trình chấm [Run](https://imgur.com/a/W9Nn2Jf)  

    -----------------------------

#### This is a free software made by Coo.King
#### Please give credit when make a copy.
#### Thank you

> Have you ask google yet ?  
  > > > > > > > > > CooKing
