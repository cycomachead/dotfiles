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

nas_dest="/Volumes/Michael_NAS"
drobo_dest="/Volumes/Michael Ball"

cur_day=`date | cut -c1-3`

if [$cur_day -eq "Mon" ]; then
    
else if [$cur_day -eq "Tue" ]; then
    
else if [$cur_day -eq "Wed" ]; then
    
else if [$cur_day -eq "Thu" ]; then
    
else
    exit 0; #No Need to backup today.