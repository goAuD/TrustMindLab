#!/bin/bash
# Locks the current kernel and its modules to prevent automatic updates

sudo dnf versionlock add kernel kernel-core kernel-modules kernel-modules-extra
