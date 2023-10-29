#!/bin/bash

CPU_MODEL_NAME=$(cat /proc/cpuinfo | awk -F ': ' '/model name/ {if (!seen[$2]++) print $2}')
CPU_CORE_COUNT=$(cat /proc/cpuinfo | grep -m 1 "cpu cores" | awk '{print $4}')
CPU_PROCESSOR_COUNT=$(cat /proc/cpuinfo | grep -c "processor")
PHYSICAL_CHIP_COUNT=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

echo "<< CPU >>"
echo "CPU Model      : ${CPU_MODEL_NAME}"
echo "--- Cores      : ${CPU_CORE_COUNT}" 
echo "--- Processors : ${CPU_PROCESSOR_COUNT}"
echo "--- Counts     : ${PHYSICAL_CHIP_COUNT}"
echo "\n"

echo "<< RAM >>"
free -h
echo "\n"

echo "<< DISK >>"
df -h | grep "Filesystem"
df -h | grep "/dev/*"
