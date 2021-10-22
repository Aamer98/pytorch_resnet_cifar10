#!/bin/bash
#SBATCH --mail-user=ar.aamer@gmail.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --job-name=vanilla_cifar_new.sh
#SBATCH --output=%x-%j.out
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=32
#SBATCH --mem=127000M
#SBATCH --time=0-00:10
#SBATCH --account=rrg-ebrahimi


nvidia-smi

module load python
source ~/py37/bin/activate


echo "------------------------------------< Data preparation>----------------------------------"
echo "Copying the source code"
date +"%T"
cd $SLURM_TMPDIR
cp -r ~/scratch/pytorch_resnet_cifar10 .


date +"%T"


echo "---------------------------------------<End of program>-------------------------------------"

date +"%T"\
cd $SLURM_TMPDIR



date +"%T"\
echo "----------------------------------<Copying files to root>--------------------------------"
cp -r $SLURM_TMPDIR/pytorch_resnet_cifar10 ~
echo "----------------------------------<Copying files to Scratch>--------------------------------"
cp -r $SLURM_TMPDIR/pytorch_resnet_cifar10 ~/scratch/

date +"%T"\