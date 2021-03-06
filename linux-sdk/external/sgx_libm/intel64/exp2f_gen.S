/*
* Math library
*
* Copyright (C) 2016 Intel Corporation. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above copyright
*     notice, this list of conditions and the following disclaimer in
*     the documentation and/or other materials provided with the
*     distribution.
*   * Neither the name of Intel Corporation nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*
* Author Name <jingwei.zhang@intel.com>
*   History:
*   03-14-2016 Initial version. numerics svn rev. 12864
*/
	.file "exp2f_gen.c"
	.text
..TXTST0:
# -- Begin  exp2f
	.text
       .align    16,0x90
	.globl exp2f
exp2f:
# parameter 1: %xmm0
..B1.1:
	.cfi_startproc
..___tag_value_exp2f.1:
..L2:

        movaps    %xmm0, %xmm1
        movd      %xmm1, %esi
        movss     %xmm1, -8(%rsp)
        andl      $2147483647, %esi
        lea       -1065353216(%rsi), %eax
        cmpl      $58589184, %eax
        ja        ..B1.7
..B1.2:
        movl      %esi, %ecx
        movl      %esi, %eax
        shrl      $23, %ecx
        addl      $10, %ecx
        shll      %cl, %eax
        testl     %eax, %eax
        jne       ..B1.7
..B1.3:
        movss     .L_2il0floatpacket.0(%rip), %xmm0
        addss     %xmm0, %xmm1
        movss     %xmm1, -12(%rsp)
        movl      -12(%rsp), %ecx
        shll      $10, %ecx
        sarl      $10, %ecx
        cmpl      $-149, %ecx
        jl        ..B1.7
..B1.4:
        movl      %ecx, %eax
        addl      $127, %eax
        jle       ..B1.23
..B1.5:
        shll      $23, %eax
        movl      %eax, -16(%rsp)
..B1.6:
        movss     -16(%rsp), %xmm0
        ret       
..B1.7:
        cmpl      $1123680256, %esi
        jae       ..B1.12
..B1.8:
        cmpl      $830472192, %esi
        jae       ..B1.10
..B1.9:
        movss     .L_2il0floatpacket.10(%rip), %xmm0
        addss     -8(%rsp), %xmm0
        movss     %xmm0, -12(%rsp)
        ret       
..B1.10:
        pxor      %xmm3, %xmm3
        pxor      %xmm6, %xmm6
        cvtss2sd  -8(%rsp), %xmm3
        movaps    %xmm3, %xmm0
        mulsd     .L_2il0floatpacket.1(%rip), %xmm0
        movsd     .L_2il0floatpacket.6(%rip), %xmm4
        movq      __libm_expf_table_64@GOTPCREL(%rip), %rcx
        addsd     .L_2il0floatpacket.2(%rip), %xmm0
        cvtsd2ss  %xmm0, %xmm0
        movss     %xmm0, -12(%rsp)
        movss     -12(%rsp), %xmm1
        movsd     .L_2il0floatpacket.4(%rip), %xmm0
        movl      -12(%rsp), %edx
        movl      %edx, %eax
        shll      $26, %eax
        subss     .L_2il0floatpacket.0(%rip), %xmm1
        cvtss2sd  %xmm1, %xmm1
        mulsd     .L_2il0floatpacket.3(%rip), %xmm1
        sarl      $26, %eax
        addsd     %xmm1, %xmm3
        movaps    %xmm3, %xmm2
        mulsd     %xmm3, %xmm2
        mulsd     %xmm2, %xmm0
        mulsd     %xmm2, %xmm4
        addsd     .L_2il0floatpacket.5(%rip), %xmm0
        addsd     .L_2il0floatpacket.7(%rip), %xmm4
        mulsd     %xmm2, %xmm0
        mulsd     %xmm3, %xmm4
        movslq    %eax, %rax
        addsd     %xmm4, %xmm0
        movsd     256(%rcx,%rax,8), %xmm5
        subl      %eax, %edx
        mulsd     %xmm5, %xmm0
        shrl      $6, %edx
        addsd     %xmm5, %xmm0
        shll      $23, %edx
        addl      $1065353216, %edx
        movl      %edx, -24(%rsp)
        cvtss2sd  -24(%rsp), %xmm6
        mulsd     %xmm6, %xmm0
        cvtsd2ss  %xmm0, %xmm0
        movss     %xmm0, -16(%rsp)
..B1.11:
        ret       
..B1.12:
        lea       range(%rip), %rdx
        movl      -8(%rsp), %eax
        shrl      $31, %eax
        cmpl      (%rdx,%rax,4), %esi
        ja        ..B1.14
..B1.13:
        pxor      %xmm3, %xmm3
        movq      $0x3ff0000000000000, %rcx
        cvtss2sd  -8(%rsp), %xmm3
        movaps    %xmm3, %xmm0
        mulsd     .L_2il0floatpacket.1(%rip), %xmm0
        movsd     .L_2il0floatpacket.6(%rip), %xmm4
        movq      __libm_expf_table_64@GOTPCREL(%rip), %rsi
        addsd     .L_2il0floatpacket.2(%rip), %xmm0
        cvtsd2ss  %xmm0, %xmm0
        movss     %xmm0, -12(%rsp)
        movss     -12(%rsp), %xmm1
        movsd     .L_2il0floatpacket.4(%rip), %xmm0
        movl      -12(%rsp), %edx
        andl      $4194303, %edx
        subss     .L_2il0floatpacket.0(%rip), %xmm1
        cvtss2sd  %xmm1, %xmm1
        mulsd     .L_2il0floatpacket.3(%rip), %xmm1
        movl      %edx, %eax
        shll      $26, %eax
        addsd     %xmm1, %xmm3
        movaps    %xmm3, %xmm2
        mulsd     %xmm3, %xmm2
        mulsd     %xmm2, %xmm0
        mulsd     %xmm2, %xmm4
        addsd     .L_2il0floatpacket.5(%rip), %xmm0
        addsd     .L_2il0floatpacket.7(%rip), %xmm4
        mulsd     %xmm2, %xmm0
        mulsd     %xmm3, %xmm4
        sarl      $26, %eax
        addsd     %xmm4, %xmm0
        movslq    %eax, %rax
        subl      %eax, %edx
        shrl      $6, %edx
        movsd     256(%rsi,%rax,8), %xmm5
        mulsd     %xmm5, %xmm0
        shlq      $52, %rdx
        addsd     %xmm5, %xmm0
        addq      %rcx, %rdx
        movq      %rdx, -24(%rsp)
        mulsd     -24(%rsp), %xmm0
        cvtsd2ss  %xmm0, %xmm0
        movss     %xmm0, -16(%rsp)
        ret       
..B1.14:
        cmpl      $2139095040, %esi
        jae       ..B1.19
..B1.15:
        testq     %rax, %rax
        je        ..B1.17
..B1.16:
        movss     .L_2il0floatpacket.8(%rip), %xmm0
        mulss     %xmm0, %xmm0
        movss     %xmm0, -16(%rsp)
        ret       
..B1.17:
        movss     .L_2il0floatpacket.9(%rip), %xmm0
        mulss     %xmm0, %xmm0
        movss     %xmm0, -16(%rsp)
..B1.18:
        ret       
..B1.19:
        jne       ..B1.21
..B1.20:
        lea       _inf_zero(%rip), %rdx
        movss     (%rdx,%rax,4), %xmm0
        ret       
..B1.21:
        movss     -8(%rsp), %xmm0
        addss     %xmm0, %xmm0
..B1.22:
        ret       
..B1.23:
        addl      $149, %ecx
        movl      $1, %eax
        shll      %cl, %eax
        movl      %eax, -16(%rsp)
        jmp       ..B1.6
        .align    16,0x90
	.cfi_endproc
	.type	exp2f,@function
	.size	exp2f,.-exp2f
	.data
# -- End  exp2f
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0x40500000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x41680000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0xbf900000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x3e46f43a,0x3f83ce0f
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x081585e7,0x3fcebfbe
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.6:
	.long	0xd93cf576,0x3fac6af0
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,8
	.align 8
.L_2il0floatpacket.7:
	.long	0xfef9277b,0x3fe62e42
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.align 4
.L_2il0floatpacket.0:
	.long	0x4b400000
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,4
	.align 4
.L_2il0floatpacket.8:
	.long	0x0d800000
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,4
	.align 4
.L_2il0floatpacket.9:
	.long	0x71800000
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,4
	.align 4
.L_2il0floatpacket.10:
	.long	0x3f800000
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,4
	.align 4
range:
	.long	1124073471
	.long	1126039552
	.type	range,@object
	.size	range,8
	.align 4
_inf_zero:
	.long	2139095040
	.long	0
	.type	_inf_zero,@object
	.size	_inf_zero,8
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 1
# End
