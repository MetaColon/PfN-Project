CC?=clang
CFLAGS=-g -Wall -Werror -Wunused-parameter -Wunused-variable -O3 -pedantic
FILE_BASE=Program
CLIBS=-lm
DEPENDENCIES=

all:${FILE_BASE}.x

%.x:%.c ${DEPENDENCIES}
	${CC} ${CFLAGS} -o $@ $< ${CLIBS} ${DEPENDENCIES}

README:Makefile
	@echo "Program is implemented in Program.c" > $@

.PHONY:clean
clean:
	${RM} ${FILE_BASE}.[ox]
	${RM} -r ${FILE_BASE}.x.dSYM__pycache__
	${RM} sampleResult.txt
	${RM} gmon.out

.PHONY:profile
profile:
	${CC} ${CFLAGS} -pg ${FILE_BASE}.c -o ${FILE_BASE}.x ${DEPENDENCIES}
