# Build with Apptainer
APPTAINER := apptainer
BUILD_FLAGS := --userns --force

all: cuda/cuda.sif flux/flux.sif

.NOTINTERMEDIATE: %.sif

%.sif: %.def
	cd $(<D) && $(APPTAINER) build $(BUILD_FLAGS) $(abspath $@) $(<F)

# Training.sif depends on cuda
flux/flux.sif: cuda/cuda.sif
