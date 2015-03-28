#include "HelloWorld.h"
#include "stdio.h"

JNIEXPORT void JNICALL Java_HelloWorld_helloWorld
  (JNIEnv *env, jobject object)
  {
    printf("Hello, world!");
  }
