#!/bin/bash
# Removes version lock so the kernel can be updated again

sudo dnf versionlock delete kernel kernel-core kernel-modules kernel-modules-extra
