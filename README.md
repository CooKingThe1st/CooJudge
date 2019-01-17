# CooJudge
### Hướng dẫn dùng CooJudge

> Một số thuât ngữ:  
> [định dạng input] : chỉ các file có đuôi là .inp, .INP, .in hoặc .IN  
> [định dạng output] : chỉ các file có đuôi là .out, .OUT, .ans hoặc .ANS

**Ví dụ** ta có các bài cần chấm là A.cpp B.cpp và có bộ test
    bộ test được định dạng như sau
    A/testxx/A.[định dạng input] và A/testxx/A.[định dạng output]
    _(nôm na là trong folder tên A, có 1 đống các file test ví dụ như là test01 test02, trong test01 có A.inp và A.out)_

#### Một số lưu ý trước khi chấm bài
1. tất cả các file nộp bài đều  **standard input** và **standard output**
2. phải có endline (xuống dòng) ở cuối bài
3. tên file submit, tên file test, tên từng test phải giống nhau ( case sensitve )  

#### Setup
1. tạo thư mục mới để chấm bài, ví dụ là _abcd_
2. trong _abcd_, tạo các thư mục Submit và Test  
    cho A.cpp B.cpp vào thư mục Submit  
    cho folder A, B vào Test  
    cho main.sh và judge.sh vào _abcd_
3. chạy terminal, cd vào thư mục _abcd_
4. chạy lệnh $ chmod +x main.sh rồi chạy lệnh $ ./main.sh để bắt đầu chấm bài  
   hoặc là chạy $ bash main.sh để chấm bài

#### Cách chấm
hoặc là set time limit mọi bài là 1 hoặc nhập time limit cho mỗi bài

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
### Custom Judge 

Custom Judge là 1 DLC của CooJudge hỗ trợ chấm các bài yêu cầu có trình chấm.

#### Cách dùng:

Trong folder chứa testcase, ví dụ là ABC (trong ABC có chứa test01, test02), ta thêm file checker vào.  

File checker được dịch từ checker.cpp hoặc một ngôn ngữ lập trình.  
Trong đó, checker sẽ đọc từ testxx/ABC.[định dạng input], testxx/ABC.[định dạng kết quả], và testxx/ABC.ore  
    ABC.[định dạng input] là input của test case  
    ABC.[định dạng output] là output của test case
    ABC.ore là output của thí sinh.  

checker.cpp có một file sample, các bạn đọc tham khảo.

**Quan trọng:** Bài làm của thí sinh vẫn dùng stdin stdout.

#### Yêu cầu về checker

Output của checker gồm 1 hoặc 2 dòng trong đó:
* dòng 1 gồm **1 số duy nhất** chứa điểm của thí sinh, có thể là số thực hoặc số nguyên.
* dòng 2 là thông tin do checker gửi về  
Ví dụ: Kết quả sai, Kết quả khác với Coo.King, Thí sinh gọi đệ quy vô hạn...

#### Demo Screenshot for CustomJudge
1. Thư mục nơi ta chấm bài [Main Folder](https://imgur.com/a/c2WvSSd)
2. Thư mục nộp bài [Submit](https://imgur.com/a/Ltz36Az) có chứa bài làm của user cho problem abc
3. Thư mục Test: [Test](https://imgur.com/a/UEMxQVk)  có chứa 1 folder test abc  
 trong abc: [Inside abc](https://imgur.com/a/Q5s5STa) có chứa 3 folder testxx và 1 file checker, 1 file checker.cpp (file.cpp không cần thiết).
4. Chạy trình chấm [Run](https://imgur.com/a/g1BzXrO)  
Có thể thấy, test01 chạy bình thường, test02 và test10 thiếu input.
Điểm là số thực, với 4 số thập phân sau nó.  
5. File [result_abc](https://imgur.com/a/TbF09YH)

    ---------------------------------------------------------

### Từ beta 1.0.9

**Một số thay đổi**

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

**Một số thay đổi**

1. CustomJudge  
Hỗ trợ việc chấm cho các bài yêu cầu trình chấm ngoài (**LINUX** only)
2. Đã hỗ trợ cho các format input output khác  
 **.inp, .INP, .in, .IN** với input  
 **.out, .OUT, .ans, .ANS** với output

    -----------------------------

### Từ beta 1.1.1

**Một số thay đổi**
1. Fix bug sort files
2. Một số thay đổi trong CustomJudge
3. main.sh đổi thành coojudge.sh

    -----------------------------

#### This is a free judger made by Coo.King
#### Please give credit when make a copy.
#### Thank you

> Have you ask google yet ?  
  > > > > > > > > > CooKing
