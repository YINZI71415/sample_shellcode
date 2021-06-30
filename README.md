### 编译  .asm 文件流程

```
// -f 后面接要的平台
// test.asm 为编译目标
// 会在当前目录下生成 test.o
nasm -f elf64 test.asm

// 链接
// -m 后面接平台
// -s 表示是汇编
// -o 接输出
ld -m elf_x86_64 -s -o hello ./test.o
```

### 提取 shellcode
 - 建议手动提取，利用 objdump -d 对于二进制文件进行反汇编，或者用 010 提取？？？ 改天试一试

```
objdump -d ./hello | grep "[0-9a-f]" | grep -v "file" | cut -f2 -d: \
| cut -f1-6 -d' '| tr -s ' '| tr '\t' ' '| sed 's/ $//g'| sed 's/ /\\x/g' | paste -d '' -s | \
 sed 's/^/"/' | sed 's/$/"/g'


用上面的命令提取对于x64 来说会提取出错
```


### shellcode验证

 - 使用 文件 shellcode_test.c
 - 编译命令：`gcc -fno-stack-protector -z execstack  -m64 ...`

### 查看函数系统调用参数传递情况
 - man syscall ：使用linux 手册查看
 
 
 ### 系统调用方式查看
 - 请查看 libc的源代码
 - 例如 Android 源代码中就包括了各种 libc  函数库的汇编实现 
 - 例如用 clone 实现 fork 等等，使用汇编的方式 
 
 
 ### Android  arm32 shellcode
 - 文件 android32_CBshell.asm 回弹 shell
 - 编译：使用NDK的 as 和 ld
 ```
arm-linux-androideabi-as ./xxxxx.asm -o test.o
arm-linux-androideabi-ld ./test.o -o ./mmmm
arm-linux-androideabi-objdump -d ../mmmm 

 ```
 - 注意： 不要使用 arm-linux-androideabi-objdump 提取 shellcode，arm使用的是大端，arm-linux-androideabi-objdump 提取的是小端
 - shellcode 提取，在手机上运行编译好的二进制，利用 lldb 提取相关代码片段，或者参考地址：https://www.exploit-db.com/exploits/47048
 - 注意 Android 一部分手机没有 /bin 目录只有 /system/bin 目录
 
 
 
 
 ### Android arm64 shellcode
 - 文件：android64_CBshell.asm 回弹shell
 - 同 32 位 Android 编译



