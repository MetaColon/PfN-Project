CC?=clang
CFLAGS=-g -Wall -Wunused-parameter -Wunused-variable -O3 -pedantic -Wno-gnu-zero-variadic-macro-arguments
CLIBS=-lcheck -pthread -pthread -lrt -lm
MACCLIBS=-lcheck -pthread -pthread -lm
UBUNTUFLAGS=-lsubunit
FILE_BASE=Checks
DEPENDENCIES=../Sampling/Lazy_Sampling.c ../Sampling/Random.c ../Extraction/Histograms.c ../Sampling/correction.c ../Sampling/Basic_Sampling.c ../Extraction/Median.c ../Extraction/Medium.c ../Extraction/ConfidenceIntervals.c ../Extraction/AbsoluteData.c ../Extraction/RelativeData.c ../Extraction/CSV_Output.c ../Extraction/Sort.c ../Extraction/InputCheck.c

OS?=$(shell [ -e "/etc/os-release" ] && grep ^NAME=".*" /etc/os-release)
ifeq ($(OS),)
	OS=$(shell uname -s)
endif

all:${FILE_BASE}.x

%.x:%.c ${DEPENDENCIES}
ifneq (,$(findstring Ubuntu,${OS}))
# Ubuntu
	${CC} ${CFLAGS} -o $@ $< ${CLIBS} ${UBUNTUFLAGS} ${DEPENDENCIES}
else
ifeq ($(OS),Darwin)
# MacOS
	${CC} ${CFLAGS} -o $@ $< ${MACCLIBS} ${DEPENDENCIES}
else
# Everything else
	${CC} ${CFLAGS} -o $@ $< ${CLIBS} ${DEPENDENCIES}
endif
endif

README:Makefile
	@echo "Tests are implemented referenced in Checks.c \
and implemented in header files. \
Note that you might need to add source files here to be compiled." >$@

.PHONY:clean
clean:
	${RM} ${FILE_BASE}.[ox]
	${RM} gmon-out
	${RM} data.dat results.csv
