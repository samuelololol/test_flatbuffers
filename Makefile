PHONY=flatc clean all write read
INC=-I ../flatbuffers/include -I ../flatbuffers/include/flatbuffers
STATIC_LIB=../flatbuffers/build/libflatbuffers.a
CXX_FLAG=-std=c++11
CXX=g++
WSRC=writer.cpp
RSRC=reader.cpp
WTARGET=writer
RTARGET=reader
FBS_SRC=test.fbs

all:write read

write: flatc $(FBS_SRC:.fbs=_generated.h)
	$(CXX) $(CXX_FLAG) $(INC) -o $(WTARGET) $(WSRC) $(STATIC_LIB)

read: flatc $(FBS_SRC:.fbs=_generated.h)
	$(CXX) $(CXX_FLAG) $(INC) -o $(RTARGET) $(RSRC) $(STATIC_LIB)

flatc:
	../flatbuffers/build/flatc -c -o . $(FBS_SRC)

clean:
	rm -rf *.o $(WTARGET) $(RTARGET) test_generated.h
