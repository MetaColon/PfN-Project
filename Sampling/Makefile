CC?=clang
CFLAGS=-g -Wall -Werror -Wunused-parameter -Wunused-variable -O3 -pedantic
FILE_BASE=Program
DEPENDENCIES=Lazy_Sampling.c correction.c Random.c

all:${FILE_BASE}.x

%.x:%.c ${DEPENDENCIES}
	${CC} ${CFLAGS} -o $@ $< ${DEPENDENCIES}

README:Makefile
	@echo "Lazy Sampling is implemented in Lazy_Sampling.c" > $@

.PHONY:clean
clean:
	${RM} ${FILE_BASE}.[ox]
	${RM} -r ${FILE_BASE}.x.dSYM__pycache__
	${RM} sampleResult.tsv
	${RM} gmon.out

.PHONY:profile
profile:
	${CC} ${CFLAGS} -pg ${FILE_BASE}.c -o ${FILE_BASE}.x ${DEPENDENCIES}
