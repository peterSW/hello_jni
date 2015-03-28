
JAVA_HOME := /usr/lib/jvm/java-7-oracle
JAVA_PLATFORM := linux

CFLAGS := -I${JAVA_HOME}/include -I${JAVA_HOME}/include/${JAVA_PLATFORM} -fPIC


JNI_CLASSNAME := HelloWorld
TARGET_LIB := lib${JNI_CLASSNAME}.so
OBJECTS := ${JNI_CLASSNAME}.o

.phony : all
all : ${TARGET_LIB} ${JNI_CLASSNAME}.class

.phony : run
run : all
	env LD_LIBRARY_PATH=. java HelloWorld

${TARGET_LIB} : ${OBJECTS}
	$(CC) -shared -o $@ $^

%.h : %.class
	javah -classpath . $(basename $^)

%.class : %.java
	javac $^

${JNI_CLASSNAME}.c : ${JNI_CLASSNAME}.h

.phony : clean
clean:
	rm -f *.so *.class *.o $(JNI_CLASSNAME).h
