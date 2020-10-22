#!/bin/bash

mkdir -p demo/bin

CUDA="-arch=sm_52 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-gencode arch=compute_75,code=compute_75"

# Make Similarity Combo
SOURCE=similarity_subnet/linux/similarity_combo/source

nvcc $CUDA $SOURCE/*.cu $SOURCE/*.cpp -Icaffe/include -Icaffe/build/src -Lcaffe/build/lib -o demo/bin/similarity_combo -std=c++11 \
    -I/usr/include/eigen3 -lopencv_core -lopencv_highgui -lopencv_imgproc \
    -lopencv_imgcodecs -lboost_system -lboost_filesystem -lcublas -lcaffe -lglog

# Make Deep Image Analogy
SOURCE=similarity_subnet/linux/deep_image_analogy/source

nvcc $CUDA $SOURCE/*.cu $SOURCE/*.cpp -Icaffe/include -Icaffe/build/src -Lcaffe/build/lib -o demo/bin/deep_image_analogy -std=c++11 \
    -I/usr/include/eigen3 -lopencv_core -lopencv_highgui -lopencv_imgproc \
    -lopencv_imgcodecs -lboost_system -lboost_filesystem -lcublas -lcaffe -lglog
