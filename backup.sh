#! /bin/bash

# A backup script for files

# Archived Photos
# Video Work
# Rsync based
# Alternate Based on days of week
# MTWR
# Photos -> Video -> Photos -> Video
# NAS  -> Drobo -> Drobo -> NAS
# 
# Don't backup Images Removed from Aperture Vault
# 
#
rsy_base="rsync -ahvz"
rsy_opt=""
rsy_exc1="--exlude"