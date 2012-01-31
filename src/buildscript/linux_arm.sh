#!/usr/bin/env bash
# AUTO-GENERATED by buildscript.sh; DO NOT EDIT.
# This script builds the go command (written in Go),
# and then the go command can build the rest of the tree.

export GOOS=linux
export GOARCH=arm
export WORK=$(mktemp -d -t go-build.XXXXXX)
trap "rm -rf $WORK" EXIT SIGINT SIGTERM
set -e



#
# runtime
#

mkdir -p "$WORK"/runtime/_obj/
cd "$GOROOT"/src/pkg/runtime
"$GOROOT"/bin/go-tool/5g -o "$WORK"/runtime/_obj/_go_.5 -p runtime -+ -I "$WORK" ./debug.go ./error.go ./extern.go ./mem.go ./sig.go ./softfloat64.go ./type.go ./zgoarch_arm.go ./zgoos_linux.go ./zruntime_defs_linux_arm.go ./zversion.go
cp "$GOROOT"/src/pkg/runtime/arch_arm.h "$WORK"/runtime/_obj/arch_GOARCH.h
cp "$GOROOT"/src/pkg/runtime/defs_linux_arm.h "$WORK"/runtime/_obj/defs_GOOS_GOARCH.h
cp "$GOROOT"/src/pkg/runtime/os_linux.h "$WORK"/runtime/_obj/os_GOOS.h
cp "$GOROOT"/src/pkg/runtime/signals_linux.h "$WORK"/runtime/_obj/signals_GOOS.h
cp "$GOROOT"/src/pkg/runtime/zasm_linux_arm.h "$WORK"/runtime/_obj/zasm_GOOS_GOARCH.h
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/alg.5 -DGOOS_linux -DGOARCH_arm ./alg.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/atomic_arm.5 -DGOOS_linux -DGOARCH_arm ./atomic_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/cgocall.5 -DGOOS_linux -DGOARCH_arm ./cgocall.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/chan.5 -DGOOS_linux -DGOARCH_arm ./chan.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/closure_arm.5 -DGOOS_linux -DGOARCH_arm ./closure_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/complex.5 -DGOOS_linux -DGOARCH_arm ./complex.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/cpuprof.5 -DGOOS_linux -DGOARCH_arm ./cpuprof.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/float.5 -DGOOS_linux -DGOARCH_arm ./float.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/hashmap.5 -DGOOS_linux -DGOARCH_arm ./hashmap.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/iface.5 -DGOOS_linux -DGOARCH_arm ./iface.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/lock_futex.5 -DGOOS_linux -DGOARCH_arm ./lock_futex.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mcache.5 -DGOOS_linux -DGOARCH_arm ./mcache.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mcentral.5 -DGOOS_linux -DGOARCH_arm ./mcentral.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mem_linux.5 -DGOOS_linux -DGOARCH_arm ./mem_linux.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mfinal.5 -DGOOS_linux -DGOARCH_arm ./mfinal.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mfixalloc.5 -DGOOS_linux -DGOARCH_arm ./mfixalloc.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mgc0.5 -DGOOS_linux -DGOARCH_arm ./mgc0.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/mheap.5 -DGOOS_linux -DGOARCH_arm ./mheap.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/msize.5 -DGOOS_linux -DGOARCH_arm ./msize.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/print.5 -DGOOS_linux -DGOARCH_arm ./print.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/proc.5 -DGOOS_linux -DGOARCH_arm ./proc.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/rune.5 -DGOOS_linux -DGOARCH_arm ./rune.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/runtime.5 -DGOOS_linux -DGOARCH_arm ./runtime.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/signal_linux_arm.5 -DGOOS_linux -DGOARCH_arm ./signal_linux_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/slice.5 -DGOOS_linux -DGOARCH_arm ./slice.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/softfloat_arm.5 -DGOOS_linux -DGOARCH_arm ./softfloat_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/symtab.5 -DGOOS_linux -DGOARCH_arm ./symtab.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/thread_linux.5 -DGOOS_linux -DGOARCH_arm ./thread_linux.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/traceback_arm.5 -DGOOS_linux -DGOARCH_arm ./traceback_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/vlrt_arm.5 -DGOOS_linux -DGOARCH_arm ./vlrt_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/zmalloc_arm.5 -DGOOS_linux -DGOARCH_arm ./zmalloc_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/zmprof_arm.5 -DGOOS_linux -DGOARCH_arm ./zmprof_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/zruntime1_arm.5 -DGOOS_linux -DGOARCH_arm ./zruntime1_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/zsema_arm.5 -DGOOS_linux -DGOARCH_arm ./zsema_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/zsigqueue_arm.5 -DGOOS_linux -DGOARCH_arm ./zsigqueue_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/zstring_arm.5 -DGOOS_linux -DGOARCH_arm ./zstring_arm.c
"$GOROOT"/bin/go-tool/5c -FVw -I "$WORK"/runtime/_obj/ -I "$GOROOT"/pkg/linux_arm -o "$WORK"/runtime/_obj/ztime_arm.5 -DGOOS_linux -DGOARCH_arm ./ztime_arm.c
"$GOROOT"/bin/go-tool/5a -I "$WORK"/runtime/_obj/ -o "$WORK"/runtime/_obj/asm_arm.5 -DGOOS_linux -DGOARCH_arm ./asm_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/runtime/_obj/ -o "$WORK"/runtime/_obj/memmove_arm.5 -DGOOS_linux -DGOARCH_arm ./memmove_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/runtime/_obj/ -o "$WORK"/runtime/_obj/memset_arm.5 -DGOOS_linux -DGOARCH_arm ./memset_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/runtime/_obj/ -o "$WORK"/runtime/_obj/rt0_linux_arm.5 -DGOOS_linux -DGOARCH_arm ./rt0_linux_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/runtime/_obj/ -o "$WORK"/runtime/_obj/sys_linux_arm.5 -DGOOS_linux -DGOARCH_arm ./sys_linux_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/runtime/_obj/ -o "$WORK"/runtime/_obj/vlop_arm.5 -DGOOS_linux -DGOARCH_arm ./vlop_arm.s
"$GOROOT"/bin/go-tool/pack grc "$WORK"/runtime.a "$WORK"/runtime/_obj/_go_.5 "$WORK"/runtime/_obj/alg.5 "$WORK"/runtime/_obj/atomic_arm.5 "$WORK"/runtime/_obj/cgocall.5 "$WORK"/runtime/_obj/chan.5 "$WORK"/runtime/_obj/closure_arm.5 "$WORK"/runtime/_obj/complex.5 "$WORK"/runtime/_obj/cpuprof.5 "$WORK"/runtime/_obj/float.5 "$WORK"/runtime/_obj/hashmap.5 "$WORK"/runtime/_obj/iface.5 "$WORK"/runtime/_obj/lock_futex.5 "$WORK"/runtime/_obj/mcache.5 "$WORK"/runtime/_obj/mcentral.5 "$WORK"/runtime/_obj/mem_linux.5 "$WORK"/runtime/_obj/mfinal.5 "$WORK"/runtime/_obj/mfixalloc.5 "$WORK"/runtime/_obj/mgc0.5 "$WORK"/runtime/_obj/mheap.5 "$WORK"/runtime/_obj/msize.5 "$WORK"/runtime/_obj/print.5 "$WORK"/runtime/_obj/proc.5 "$WORK"/runtime/_obj/rune.5 "$WORK"/runtime/_obj/runtime.5 "$WORK"/runtime/_obj/signal_linux_arm.5 "$WORK"/runtime/_obj/slice.5 "$WORK"/runtime/_obj/softfloat_arm.5 "$WORK"/runtime/_obj/symtab.5 "$WORK"/runtime/_obj/thread_linux.5 "$WORK"/runtime/_obj/traceback_arm.5 "$WORK"/runtime/_obj/vlrt_arm.5 "$WORK"/runtime/_obj/zmalloc_arm.5 "$WORK"/runtime/_obj/zmprof_arm.5 "$WORK"/runtime/_obj/zruntime1_arm.5 "$WORK"/runtime/_obj/zsema_arm.5 "$WORK"/runtime/_obj/zsigqueue_arm.5 "$WORK"/runtime/_obj/zstring_arm.5 "$WORK"/runtime/_obj/ztime_arm.5 "$WORK"/runtime/_obj/asm_arm.5 "$WORK"/runtime/_obj/memmove_arm.5 "$WORK"/runtime/_obj/memset_arm.5 "$WORK"/runtime/_obj/rt0_linux_arm.5 "$WORK"/runtime/_obj/sys_linux_arm.5 "$WORK"/runtime/_obj/vlop_arm.5
mkdir -p "$GOROOT"/pkg/linux_arm/
cp "$WORK"/runtime.a "$GOROOT"/pkg/linux_arm/runtime.a

#
# errors
#

mkdir -p "$WORK"/errors/_obj/
cd "$GOROOT"/src/pkg/errors
"$GOROOT"/bin/go-tool/5g -o "$WORK"/errors/_obj/_go_.5 -p errors -I "$WORK" ./errors.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/errors.a "$WORK"/errors/_obj/_go_.5
cp "$WORK"/errors.a "$GOROOT"/pkg/linux_arm/errors.a

#
# sync/atomic
#

mkdir -p "$WORK"/sync/atomic/_obj/
cd "$GOROOT"/src/pkg/sync/atomic
"$GOROOT"/bin/go-tool/5g -o "$WORK"/sync/atomic/_obj/_go_.5 -p sync/atomic -I "$WORK" ./doc.go
"$GOROOT"/bin/go-tool/5a -I "$WORK"/sync/atomic/_obj/ -o "$WORK"/sync/atomic/_obj/asm_arm.5 -DGOOS_linux -DGOARCH_arm ./asm_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/sync/atomic/_obj/ -o "$WORK"/sync/atomic/_obj/asm_linux_arm.5 -DGOOS_linux -DGOARCH_arm ./asm_linux_arm.s
"$GOROOT"/bin/go-tool/pack grc "$WORK"/sync/atomic.a "$WORK"/sync/atomic/_obj/_go_.5 "$WORK"/sync/atomic/_obj/asm_arm.5 "$WORK"/sync/atomic/_obj/asm_linux_arm.5
mkdir -p "$GOROOT"/pkg/linux_arm/sync/
cp "$WORK"/sync/atomic.a "$GOROOT"/pkg/linux_arm/sync/atomic.a

#
# sync
#

mkdir -p "$WORK"/sync/_obj/
cd "$GOROOT"/src/pkg/sync
"$GOROOT"/bin/go-tool/5g -o "$WORK"/sync/_obj/_go_.5 -p sync -I "$WORK" ./cond.go ./mutex.go ./once.go ./rwmutex.go ./waitgroup.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/sync.a "$WORK"/sync/_obj/_go_.5
cp "$WORK"/sync.a "$GOROOT"/pkg/linux_arm/sync.a

#
# io
#

mkdir -p "$WORK"/io/_obj/
cd "$GOROOT"/src/pkg/io
"$GOROOT"/bin/go-tool/5g -o "$WORK"/io/_obj/_go_.5 -p io -I "$WORK" ./io.go ./multi.go ./pipe.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/io.a "$WORK"/io/_obj/_go_.5
cp "$WORK"/io.a "$GOROOT"/pkg/linux_arm/io.a

#
# unicode
#

mkdir -p "$WORK"/unicode/_obj/
cd "$GOROOT"/src/pkg/unicode
"$GOROOT"/bin/go-tool/5g -o "$WORK"/unicode/_obj/_go_.5 -p unicode -I "$WORK" ./casetables.go ./digit.go ./graphic.go ./letter.go ./tables.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/unicode.a "$WORK"/unicode/_obj/_go_.5
cp "$WORK"/unicode.a "$GOROOT"/pkg/linux_arm/unicode.a

#
# unicode/utf8
#

mkdir -p "$WORK"/unicode/utf8/_obj/
cd "$GOROOT"/src/pkg/unicode/utf8
"$GOROOT"/bin/go-tool/5g -o "$WORK"/unicode/utf8/_obj/_go_.5 -p unicode/utf8 -I "$WORK" ./utf8.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/unicode/utf8.a "$WORK"/unicode/utf8/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/unicode/
cp "$WORK"/unicode/utf8.a "$GOROOT"/pkg/linux_arm/unicode/utf8.a

#
# bytes
#

mkdir -p "$WORK"/bytes/_obj/
cd "$GOROOT"/src/pkg/bytes
"$GOROOT"/bin/go-tool/5g -o "$WORK"/bytes/_obj/_go_.5 -p bytes -I "$WORK" ./buffer.go ./bytes.go ./bytes_decl.go
"$GOROOT"/bin/go-tool/5a -I "$WORK"/bytes/_obj/ -o "$WORK"/bytes/_obj/asm_arm.5 -DGOOS_linux -DGOARCH_arm ./asm_arm.s
"$GOROOT"/bin/go-tool/pack grc "$WORK"/bytes.a "$WORK"/bytes/_obj/_go_.5 "$WORK"/bytes/_obj/asm_arm.5
cp "$WORK"/bytes.a "$GOROOT"/pkg/linux_arm/bytes.a

#
# math
#

mkdir -p "$WORK"/math/_obj/
cd "$GOROOT"/src/pkg/math
"$GOROOT"/bin/go-tool/5g -o "$WORK"/math/_obj/_go_.5 -p math -I "$WORK" ./abs.go ./acosh.go ./asin.go ./asinh.go ./atan.go ./atan2.go ./atanh.go ./bits.go ./cbrt.go ./const.go ./copysign.go ./dim.go ./erf.go ./exp.go ./expm1.go ./floor.go ./frexp.go ./gamma.go ./hypot.go ./j0.go ./j1.go ./jn.go ./ldexp.go ./lgamma.go ./log.go ./log10.go ./log1p.go ./logb.go ./mod.go ./modf.go ./nextafter.go ./pow.go ./pow10.go ./remainder.go ./signbit.go ./sin.go ./sincos.go ./sinh.go ./sqrt.go ./tan.go ./tanh.go ./unsafe.go
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/abs_arm.5 -DGOOS_linux -DGOARCH_arm ./abs_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/asin_arm.5 -DGOOS_linux -DGOARCH_arm ./asin_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/atan2_arm.5 -DGOOS_linux -DGOARCH_arm ./atan2_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/atan_arm.5 -DGOOS_linux -DGOARCH_arm ./atan_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/dim_arm.5 -DGOOS_linux -DGOARCH_arm ./dim_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/exp2_arm.5 -DGOOS_linux -DGOARCH_arm ./exp2_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/exp_arm.5 -DGOOS_linux -DGOARCH_arm ./exp_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/expm1_arm.5 -DGOOS_linux -DGOARCH_arm ./expm1_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/floor_arm.5 -DGOOS_linux -DGOARCH_arm ./floor_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/frexp_arm.5 -DGOOS_linux -DGOARCH_arm ./frexp_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/hypot_arm.5 -DGOOS_linux -DGOARCH_arm ./hypot_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/ldexp_arm.5 -DGOOS_linux -DGOARCH_arm ./ldexp_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/log10_arm.5 -DGOOS_linux -DGOARCH_arm ./log10_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/log1p_arm.5 -DGOOS_linux -DGOARCH_arm ./log1p_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/log_arm.5 -DGOOS_linux -DGOARCH_arm ./log_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/mod_arm.5 -DGOOS_linux -DGOARCH_arm ./mod_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/modf_arm.5 -DGOOS_linux -DGOARCH_arm ./modf_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/remainder_arm.5 -DGOOS_linux -DGOARCH_arm ./remainder_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/sin_arm.5 -DGOOS_linux -DGOARCH_arm ./sin_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/sincos_arm.5 -DGOOS_linux -DGOARCH_arm ./sincos_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/sqrt_arm.5 -DGOOS_linux -DGOARCH_arm ./sqrt_arm.s
"$GOROOT"/bin/go-tool/5a -I "$WORK"/math/_obj/ -o "$WORK"/math/_obj/tan_arm.5 -DGOOS_linux -DGOARCH_arm ./tan_arm.s
"$GOROOT"/bin/go-tool/pack grc "$WORK"/math.a "$WORK"/math/_obj/_go_.5 "$WORK"/math/_obj/abs_arm.5 "$WORK"/math/_obj/asin_arm.5 "$WORK"/math/_obj/atan2_arm.5 "$WORK"/math/_obj/atan_arm.5 "$WORK"/math/_obj/dim_arm.5 "$WORK"/math/_obj/exp2_arm.5 "$WORK"/math/_obj/exp_arm.5 "$WORK"/math/_obj/expm1_arm.5 "$WORK"/math/_obj/floor_arm.5 "$WORK"/math/_obj/frexp_arm.5 "$WORK"/math/_obj/hypot_arm.5 "$WORK"/math/_obj/ldexp_arm.5 "$WORK"/math/_obj/log10_arm.5 "$WORK"/math/_obj/log1p_arm.5 "$WORK"/math/_obj/log_arm.5 "$WORK"/math/_obj/mod_arm.5 "$WORK"/math/_obj/modf_arm.5 "$WORK"/math/_obj/remainder_arm.5 "$WORK"/math/_obj/sin_arm.5 "$WORK"/math/_obj/sincos_arm.5 "$WORK"/math/_obj/sqrt_arm.5 "$WORK"/math/_obj/tan_arm.5
cp "$WORK"/math.a "$GOROOT"/pkg/linux_arm/math.a

#
# sort
#

mkdir -p "$WORK"/sort/_obj/
cd "$GOROOT"/src/pkg/sort
"$GOROOT"/bin/go-tool/5g -o "$WORK"/sort/_obj/_go_.5 -p sort -I "$WORK" ./search.go ./sort.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/sort.a "$WORK"/sort/_obj/_go_.5
cp "$WORK"/sort.a "$GOROOT"/pkg/linux_arm/sort.a

#
# container/heap
#

mkdir -p "$WORK"/container/heap/_obj/
cd "$GOROOT"/src/pkg/container/heap
"$GOROOT"/bin/go-tool/5g -o "$WORK"/container/heap/_obj/_go_.5 -p container/heap -I "$WORK" ./heap.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/container/heap.a "$WORK"/container/heap/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/container/
cp "$WORK"/container/heap.a "$GOROOT"/pkg/linux_arm/container/heap.a

#
# strings
#

mkdir -p "$WORK"/strings/_obj/
cd "$GOROOT"/src/pkg/strings
"$GOROOT"/bin/go-tool/5g -o "$WORK"/strings/_obj/_go_.5 -p strings -I "$WORK" ./reader.go ./replace.go ./strings.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/strings.a "$WORK"/strings/_obj/_go_.5
cp "$WORK"/strings.a "$GOROOT"/pkg/linux_arm/strings.a

#
# strconv
#

mkdir -p "$WORK"/strconv/_obj/
cd "$GOROOT"/src/pkg/strconv
"$GOROOT"/bin/go-tool/5g -o "$WORK"/strconv/_obj/_go_.5 -p strconv -I "$WORK" ./atob.go ./atof.go ./atoi.go ./decimal.go ./extfloat.go ./ftoa.go ./itoa.go ./quote.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/strconv.a "$WORK"/strconv/_obj/_go_.5
cp "$WORK"/strconv.a "$GOROOT"/pkg/linux_arm/strconv.a

#
# encoding/base64
#

mkdir -p "$WORK"/encoding/base64/_obj/
cd "$GOROOT"/src/pkg/encoding/base64
"$GOROOT"/bin/go-tool/5g -o "$WORK"/encoding/base64/_obj/_go_.5 -p encoding/base64 -I "$WORK" ./base64.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/encoding/base64.a "$WORK"/encoding/base64/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/encoding/
cp "$WORK"/encoding/base64.a "$GOROOT"/pkg/linux_arm/encoding/base64.a

#
# syscall
#

mkdir -p "$WORK"/syscall/_obj/
cd "$GOROOT"/src/pkg/syscall
"$GOROOT"/bin/go-tool/5g -o "$WORK"/syscall/_obj/_go_.5 -p syscall -I "$WORK" ./env_unix.go ./exec_linux.go ./exec_unix.go ./lsf_linux.go ./netlink_linux.go ./sockcmsg_linux.go ./sockcmsg_unix.go ./str.go ./syscall.go ./syscall_linux.go ./syscall_linux_arm.go ./syscall_unix.go ./zerrors_linux_arm.go ./zsyscall_linux_arm.go ./zsysnum_linux_arm.go ./ztypes_linux_arm.go
"$GOROOT"/bin/go-tool/5a -I "$WORK"/syscall/_obj/ -o "$WORK"/syscall/_obj/asm_linux_arm.5 -DGOOS_linux -DGOARCH_arm ./asm_linux_arm.s
"$GOROOT"/bin/go-tool/pack grc "$WORK"/syscall.a "$WORK"/syscall/_obj/_go_.5 "$WORK"/syscall/_obj/asm_linux_arm.5
cp "$WORK"/syscall.a "$GOROOT"/pkg/linux_arm/syscall.a

#
# time
#

mkdir -p "$WORK"/time/_obj/
cd "$GOROOT"/src/pkg/time
"$GOROOT"/bin/go-tool/5g -o "$WORK"/time/_obj/_go_.5 -p time -I "$WORK" ./format.go ./sleep.go ./sys_unix.go ./tick.go ./time.go ./zoneinfo.go ./zoneinfo_unix.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/time.a "$WORK"/time/_obj/_go_.5
cp "$WORK"/time.a "$GOROOT"/pkg/linux_arm/time.a

#
# os
#

mkdir -p "$WORK"/os/_obj/
cd "$GOROOT"/src/pkg/os
"$GOROOT"/bin/go-tool/5g -o "$WORK"/os/_obj/_go_.5 -p os -I "$WORK" ./dir_unix.go ./doc.go ./env.go ./error.go ./error_posix.go ./exec.go ./exec_posix.go ./exec_unix.go ./file.go ./file_posix.go ./file_unix.go ./getwd.go ./path.go ./path_unix.go ./proc.go ./stat_linux.go ./sys_linux.go ./time.go ./types.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/os.a "$WORK"/os/_obj/_go_.5
cp "$WORK"/os.a "$GOROOT"/pkg/linux_arm/os.a

#
# reflect
#

mkdir -p "$WORK"/reflect/_obj/
cd "$GOROOT"/src/pkg/reflect
"$GOROOT"/bin/go-tool/5g -o "$WORK"/reflect/_obj/_go_.5 -p reflect -I "$WORK" ./deepequal.go ./type.go ./value.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/reflect.a "$WORK"/reflect/_obj/_go_.5
cp "$WORK"/reflect.a "$GOROOT"/pkg/linux_arm/reflect.a

#
# fmt
#

mkdir -p "$WORK"/fmt/_obj/
cd "$GOROOT"/src/pkg/fmt
"$GOROOT"/bin/go-tool/5g -o "$WORK"/fmt/_obj/_go_.5 -p fmt -I "$WORK" ./doc.go ./format.go ./print.go ./scan.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/fmt.a "$WORK"/fmt/_obj/_go_.5
cp "$WORK"/fmt.a "$GOROOT"/pkg/linux_arm/fmt.a

#
# unicode/utf16
#

mkdir -p "$WORK"/unicode/utf16/_obj/
cd "$GOROOT"/src/pkg/unicode/utf16
"$GOROOT"/bin/go-tool/5g -o "$WORK"/unicode/utf16/_obj/_go_.5 -p unicode/utf16 -I "$WORK" ./utf16.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/unicode/utf16.a "$WORK"/unicode/utf16/_obj/_go_.5
cp "$WORK"/unicode/utf16.a "$GOROOT"/pkg/linux_arm/unicode/utf16.a

#
# encoding/json
#

mkdir -p "$WORK"/encoding/json/_obj/
cd "$GOROOT"/src/pkg/encoding/json
"$GOROOT"/bin/go-tool/5g -o "$WORK"/encoding/json/_obj/_go_.5 -p encoding/json -I "$WORK" ./decode.go ./encode.go ./indent.go ./scanner.go ./stream.go ./tags.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/encoding/json.a "$WORK"/encoding/json/_obj/_go_.5
cp "$WORK"/encoding/json.a "$GOROOT"/pkg/linux_arm/encoding/json.a

#
# flag
#

mkdir -p "$WORK"/flag/_obj/
cd "$GOROOT"/src/pkg/flag
"$GOROOT"/bin/go-tool/5g -o "$WORK"/flag/_obj/_go_.5 -p flag -I "$WORK" ./flag.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/flag.a "$WORK"/flag/_obj/_go_.5
cp "$WORK"/flag.a "$GOROOT"/pkg/linux_arm/flag.a

#
# bufio
#

mkdir -p "$WORK"/bufio/_obj/
cd "$GOROOT"/src/pkg/bufio
"$GOROOT"/bin/go-tool/5g -o "$WORK"/bufio/_obj/_go_.5 -p bufio -I "$WORK" ./bufio.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/bufio.a "$WORK"/bufio/_obj/_go_.5
cp "$WORK"/bufio.a "$GOROOT"/pkg/linux_arm/bufio.a

#
# encoding/gob
#

mkdir -p "$WORK"/encoding/gob/_obj/
cd "$GOROOT"/src/pkg/encoding/gob
"$GOROOT"/bin/go-tool/5g -o "$WORK"/encoding/gob/_obj/_go_.5 -p encoding/gob -I "$WORK" ./decode.go ./decoder.go ./doc.go ./encode.go ./encoder.go ./error.go ./type.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/encoding/gob.a "$WORK"/encoding/gob/_obj/_go_.5
cp "$WORK"/encoding/gob.a "$GOROOT"/pkg/linux_arm/encoding/gob.a

#
# go/token
#

mkdir -p "$WORK"/go/token/_obj/
cd "$GOROOT"/src/pkg/go/token
"$GOROOT"/bin/go-tool/5g -o "$WORK"/go/token/_obj/_go_.5 -p go/token -I "$WORK" ./position.go ./serialize.go ./token.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/go/token.a "$WORK"/go/token/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/go/
cp "$WORK"/go/token.a "$GOROOT"/pkg/linux_arm/go/token.a

#
# path/filepath
#

mkdir -p "$WORK"/path/filepath/_obj/
cd "$GOROOT"/src/pkg/path/filepath
"$GOROOT"/bin/go-tool/5g -o "$WORK"/path/filepath/_obj/_go_.5 -p path/filepath -I "$WORK" ./match.go ./path.go ./path_unix.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/path/filepath.a "$WORK"/path/filepath/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/path/
cp "$WORK"/path/filepath.a "$GOROOT"/pkg/linux_arm/path/filepath.a

#
# go/scanner
#

mkdir -p "$WORK"/go/scanner/_obj/
cd "$GOROOT"/src/pkg/go/scanner
"$GOROOT"/bin/go-tool/5g -o "$WORK"/go/scanner/_obj/_go_.5 -p go/scanner -I "$WORK" ./errors.go ./scanner.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/go/scanner.a "$WORK"/go/scanner/_obj/_go_.5
cp "$WORK"/go/scanner.a "$GOROOT"/pkg/linux_arm/go/scanner.a

#
# go/ast
#

mkdir -p "$WORK"/go/ast/_obj/
cd "$GOROOT"/src/pkg/go/ast
"$GOROOT"/bin/go-tool/5g -o "$WORK"/go/ast/_obj/_go_.5 -p go/ast -I "$WORK" ./ast.go ./filter.go ./import.go ./print.go ./resolve.go ./scope.go ./walk.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/go/ast.a "$WORK"/go/ast/_obj/_go_.5
cp "$WORK"/go/ast.a "$GOROOT"/pkg/linux_arm/go/ast.a

#
# io/ioutil
#

mkdir -p "$WORK"/io/ioutil/_obj/
cd "$GOROOT"/src/pkg/io/ioutil
"$GOROOT"/bin/go-tool/5g -o "$WORK"/io/ioutil/_obj/_go_.5 -p io/ioutil -I "$WORK" ./ioutil.go ./tempfile.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/io/ioutil.a "$WORK"/io/ioutil/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/io/
cp "$WORK"/io/ioutil.a "$GOROOT"/pkg/linux_arm/io/ioutil.a

#
# go/parser
#

mkdir -p "$WORK"/go/parser/_obj/
cd "$GOROOT"/src/pkg/go/parser
"$GOROOT"/bin/go-tool/5g -o "$WORK"/go/parser/_obj/_go_.5 -p go/parser -I "$WORK" ./interface.go ./parser.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/go/parser.a "$WORK"/go/parser/_obj/_go_.5
cp "$WORK"/go/parser.a "$GOROOT"/pkg/linux_arm/go/parser.a

#
# log
#

mkdir -p "$WORK"/log/_obj/
cd "$GOROOT"/src/pkg/log
"$GOROOT"/bin/go-tool/5g -o "$WORK"/log/_obj/_go_.5 -p log -I "$WORK" ./log.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/log.a "$WORK"/log/_obj/_go_.5
cp "$WORK"/log.a "$GOROOT"/pkg/linux_arm/log.a

#
# path
#

mkdir -p "$WORK"/path/_obj/
cd "$GOROOT"/src/pkg/path
"$GOROOT"/bin/go-tool/5g -o "$WORK"/path/_obj/_go_.5 -p path -I "$WORK" ./match.go ./path.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/path.a "$WORK"/path/_obj/_go_.5
cp "$WORK"/path.a "$GOROOT"/pkg/linux_arm/path.a

#
# go/build
#

mkdir -p "$WORK"/go/build/_obj/
cd "$GOROOT"/src/pkg/go/build
"$GOROOT"/bin/go-tool/5g -o "$WORK"/go/build/_obj/_go_.5 -p go/build -I "$WORK" ./build.go ./dir.go ./path.go ./syslist.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/go/build.a "$WORK"/go/build/_obj/_go_.5
cp "$WORK"/go/build.a "$GOROOT"/pkg/linux_arm/go/build.a

#
# os/exec
#

mkdir -p "$WORK"/os/exec/_obj/
cd "$GOROOT"/src/pkg/os/exec
"$GOROOT"/bin/go-tool/5g -o "$WORK"/os/exec/_obj/_go_.5 -p os/exec -I "$WORK" ./exec.go ./lp_unix.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/os/exec.a "$WORK"/os/exec/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/os/
cp "$WORK"/os/exec.a "$GOROOT"/pkg/linux_arm/os/exec.a

#
# regexp/syntax
#

mkdir -p "$WORK"/regexp/syntax/_obj/
cd "$GOROOT"/src/pkg/regexp/syntax
"$GOROOT"/bin/go-tool/5g -o "$WORK"/regexp/syntax/_obj/_go_.5 -p regexp/syntax -I "$WORK" ./compile.go ./parse.go ./perl_groups.go ./prog.go ./regexp.go ./simplify.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/regexp/syntax.a "$WORK"/regexp/syntax/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/regexp/
cp "$WORK"/regexp/syntax.a "$GOROOT"/pkg/linux_arm/regexp/syntax.a

#
# regexp
#

mkdir -p "$WORK"/regexp/_obj/
cd "$GOROOT"/src/pkg/regexp
"$GOROOT"/bin/go-tool/5g -o "$WORK"/regexp/_obj/_go_.5 -p regexp -I "$WORK" ./exec.go ./regexp.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/regexp.a "$WORK"/regexp/_obj/_go_.5
cp "$WORK"/regexp.a "$GOROOT"/pkg/linux_arm/regexp.a

#
# net/url
#

mkdir -p "$WORK"/net/url/_obj/
cd "$GOROOT"/src/pkg/net/url
"$GOROOT"/bin/go-tool/5g -o "$WORK"/net/url/_obj/_go_.5 -p net/url -I "$WORK" ./url.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/net/url.a "$WORK"/net/url/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/net/
cp "$WORK"/net/url.a "$GOROOT"/pkg/linux_arm/net/url.a

#
# text/template/parse
#

mkdir -p "$WORK"/text/template/parse/_obj/
cd "$GOROOT"/src/pkg/text/template/parse
"$GOROOT"/bin/go-tool/5g -o "$WORK"/text/template/parse/_obj/_go_.5 -p text/template/parse -I "$WORK" ./lex.go ./node.go ./parse.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/text/template/parse.a "$WORK"/text/template/parse/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/text/template/
cp "$WORK"/text/template/parse.a "$GOROOT"/pkg/linux_arm/text/template/parse.a

#
# text/template
#

mkdir -p "$WORK"/text/template/_obj/
cd "$GOROOT"/src/pkg/text/template
"$GOROOT"/bin/go-tool/5g -o "$WORK"/text/template/_obj/_go_.5 -p text/template -I "$WORK" ./doc.go ./exec.go ./funcs.go ./helper.go ./template.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/text/template.a "$WORK"/text/template/_obj/_go_.5
mkdir -p "$GOROOT"/pkg/linux_arm/text/
cp "$WORK"/text/template.a "$GOROOT"/pkg/linux_arm/text/template.a

#
# cmd/go
#

mkdir -p "$WORK"/cmd/go/_obj/
cd "$GOROOT"/src/cmd/go
"$GOROOT"/bin/go-tool/5g -o "$WORK"/cmd/go/_obj/_go_.5 -p cmd/go -I "$WORK" ./bootstrap.go ./build.go ./clean.go ./fix.go ./fmt.go ./get.go ./help.go ./list.go ./main.go ./pkg.go ./root.go ./run.go ./test.go ./testflag.go ./tool.go ./vcs.go ./version.go ./vet.go
"$GOROOT"/bin/go-tool/pack grc "$WORK"/cmd/go.a "$WORK"/cmd/go/_obj/_go_.5
"$GOROOT"/bin/go-tool/5l -o "$WORK"/cmd/go/_obj/a.out -L "$WORK" "$WORK"/cmd/go.a
mkdir -p "$GOBIN"/linux_arm/
cp "$WORK"/cmd/go/_obj/a.out "$GOBIN"/linux_arm/go
