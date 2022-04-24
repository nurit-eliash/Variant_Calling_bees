#!/bin/bash

#SBATCH --job-name=import_PRJNA311274
#SBATCH --partition=compute
#SBATCH --mem=30G
#SBATCH --cpus-per-task=10
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=nurit.eliash@oist.jp
#SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --input=none
#SBATCH --output=%j.ou

# create a temporary directory for this job and save the name
tempdir=$(mktemp -d /flash/EconomoU/Nurit/bee/SRA.XXXXXX)

# enter the temporary directory
cd $tempdir

# Start 'fasterq-dump' with input from bucket,
# and output to our temporary directory
export PATH=$PATH:/apps/unit/EconomoU/sratoolkit.2.10.8-centos_linux64/bin

fasterq-dump SRR6236911
fasterq-dump SRR6236912
fasterq-dump SRR6236913
fasterq-dump SRR6236914
fasterq-dump SRR6236919
fasterq-dump SRR6236920
fasterq-dump SRR6236921
fasterq-dump SRR6236922
fasterq-dump SRR6236923
fasterq-dump SRR6236924
fasterq-dump SRR6236925
fasterq-dump SRR6236926
fasterq-dump SRR6236927
fasterq-dump SRR6236928
fasterq-dump SRR6236929
fasterq-dump SRR6236930
fasterq-dump SRR6236931
fasterq-dump SRR6236932
fasterq-dump SRR6236941
fasterq-dump SRR6236957
fasterq-dump SRR6236958
fasterq-dump SRR6236959
fasterq-dump SRR6236960
fasterq-dump SRR6236962
fasterq-dump SRR6236963
fasterq-dump SRR6236964
fasterq-dump SRR6236965
fasterq-dump SRR6236966
fasterq-dump SRR6236967
fasterq-dump SRR6236968
fasterq-dump SRR6236971
fasterq-dump SRR6236972
fasterq-dump SRR6236973
fasterq-dump SRR6236974
fasterq-dump SRR6236975
fasterq-dump SRR6236976

# copy our result back to Bucket. We use "scp" to copy the data 
# back as bucket isn't writable directly from the compute nodes.
scp SRR* deigo:/bucket/EconomoU/Nurit/bee/reads/

# Clean up by removing our temporary directory
rm -r $tempdir