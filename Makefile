CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -O3 -g

NATIVE = -march=native

# Detect Windows
ifeq ($(OS), Windows_NT)
	uname_S  := Windows
else
ifeq ($(COMP), MINGW)
	uname_S  := Windows
else
	uname_S := $(shell uname -s)
endif
endif

ifeq ($(uname_S), Darwin)
	NATIVE =	
endif

SRC_FILE = blundersieve.cpp
EXT_SRC_FILE = external/gzip/gzstream.cpp
EXE_FILE = blundersieve
HEADERS = blundersieve.hpp
EXT_HEADERS = external/chess.hpp external/json.hpp external/threadpool.hpp external/gzip/gzstream.h external/parallel_hashmap/phmap.h

all: $(EXE_FILE)

$(EXE_FILE): $(SRC_FILE) $(HEADERS) $(EXT_HEADERS) $(EXT_SRC_FILE)
	$(CXX) $(CXXFLAGS) $(NATIVE) -o $(EXE_FILE) $(SRC_FILE) $(EXT_SRC_FILE) -lz

format:
	clang-format -i $(SRC_FILE) $(HEADERS)

clean:
	rm -f $(EXE_FILE) $(EXE_FILE).exe
