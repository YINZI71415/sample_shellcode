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
