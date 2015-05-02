#!/bin/bash

make clean
make verbose 2> >(tee make.out >&2)