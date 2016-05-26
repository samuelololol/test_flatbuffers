PHONY=flatc clean all
INC=-I ../flatbuffers/include -I ../flatbuffers/include/flatbuffers
CXX_FLAG=-std=c++11
CXX=g++
SRC=hello.cpp
TARGET=hello
FBS_SRC=test.fbs

all: flatc $(FBS_SRC:.fbs=_generated.h)
	$(CXX) $(CXX_FLAG) $(INC) $(SRC) -o $(TARGET)

flatc:
	../flatbuffers/build/flatc -c -o . $(FBS_SRC)

clean:
	rm -rf *.o $(TARGET) test_generated.h
