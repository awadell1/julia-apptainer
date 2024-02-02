# Build with Apptainer
APPTAINER := apptainer
BUILD_FLAGS := --userns --force

all: pytorch/base.sif flux/flux.sif

.NOTINTERMEDIATE: %.sif

%.sif: %.def
	cd $(<D) && $(APPTAINER) build $(BUILD_FLAGS) $(abspath $@) $(<F)

# Training.sif depends on cuda
flux/flux.sif: pytorch/base.sif
