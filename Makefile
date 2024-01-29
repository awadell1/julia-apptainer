# Build with Apptainer
APPTAINER := apptainer
BUILD_FLAGS := --userns --force

all: cuda/cuda.sif

.NOTINTERMEDIATE: %.sif

%.sif: %.def
	cd $(<D) && $(APPTAINER) build $(BUILD_FLAGS) $(realpath $@) $(<F)
