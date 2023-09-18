#!/usr/bin/env python

import os   

# Test path
#dirpath = '/n/home08/elundgren/util_scripts/update_inputgeos/remove_families/testdir/'

# Target path
#dirpath = '/n/home08/elundgren/regal/GC/UnitTest/runs/'
dirpath = '/n/home05/msulprizio/GC/UT/runs/'

# File names
fname = 'input.geos.template'
tempfile = 'temp.input.geos.template'
archive = 'input.geos.template.old'

# Define family and species names (with MWs). Do not worry about
# lining up the MWs with other MWs in file since be removed soon
isopn      = 'ISOPN'
isopn_new1 = 'ISOPND  147.0\n'
isopn_new2 = 'ISOPNB  147.0\n'

mmn      = 'MMN'
mmn_new1 = 'MVKN   149.0\n'
mmn_new2 = 'MACRN  149.0\n'

hcfcx      = 'HCFCX'  
hcfcx_new1 = 'HCFC123  117.0\n'
hcfcx_new2 = 'HCFC141b 117.0\n'
hcfcx_new3 = 'HCFC142b 117.0\n'

# cfcx must be processed AFTER hcfcx since it is a substring of hcfcx
cfcx      = 'CFCX'
cfcx_new1 = 'CFC113  187.0\n'
cfcx_new2 = 'CFC114  187.0\n'
cfcx_new3 = 'CFC115  187.0\n'

families = [isopn, mmn, cfcx, hcfcx]

# recursively go through all subdirectories and files
for root, dirs, files in os.walk(dirpath):
    dirs[:] = [d for d in dirs if d != '.git']
    fpath = os.path.join(root, fname)
    if os.path.isfile(fpath) and not os.path.islink(fpath):

        # Initialize variables
        updates_1 = [] # firs phase of updates (tracer names)
        updates_2 = [] # second phase of updates (tracer #s)
        num_tracers = 0
        update_needed = False

        # If the archived input.geos.template.old exists, move it back to orig
        archivepath = os.path.join(root, archive)
        if os.path.isfile(archivepath):
            os.remove(fpath)
            os.rename(archivepath,fpath)

        # First, read file into single string and check if update needed
        with open(fpath) as f:
            print '*' * 60,
            s = f.read()
            if any(fam in s for fam in families):
                update_needed = True
        if not update_needed:
            print '\nSkipping ' + fpath + ' since no family tracers in file\n'
            continue
                
        # Next, replace family tracer with multiple individual species 
        # as tracer names and count the new number of tracers
        print '\nReading from file: ', fpath, '\n' 
        with open(fpath) as f:

            # Read all lines of file into a list of lines
            lines = f.readlines()

            # Loop over lines in file
            for line in lines:

                # Replace family trcr name with spc names and update total    
                if isopn in line:
                    print 'ISOPN found in file'
                    ind = line.find(isopn)
                    updates_1.append(line.replace(line[ind:], isopn_new1))
                    updates_1.append(line.replace(line[ind:], isopn_new2))
                    num_tracers += 2
                    
                elif mmn in line:
                    print 'MMN found in file'
                    ind = line.find(mmn)
                    updates_1.append(line.replace(line[ind:], mmn_new1))
                    updates_1.append(line.replace(line[ind:], mmn_new2))
                    num_tracers += 2
                elif hcfcx in line:
                    print 'HCFCX found in file'
                    ind = line.find(hcfcx)
                    updates_1.append(line.replace(line[ind:], hcfcx_new1))
                    updates_1.append(line.replace(line[ind:], hcfcx_new2))
                    updates_1.append(line.replace(line[ind:], hcfcx_new3))
                    num_tracers += 3
                elif cfcx in line:
                    print 'CFCX found in file'
                    ind = line.find(cfcx)
                    updates_1.append(line.replace(line[ind:], cfcx_new1))
                    updates_1.append(line.replace(line[ind:], cfcx_new2))
                    updates_1.append(line.replace(line[ind:], cfcx_new3))
                    num_tracers += 3

                # For non-family tracers, simply copy line and update total
                elif 'Tracer #' in line:
                    updates_1.append(line)
                    num_tracers += 1

                # Otherwise, simply copy line
                else:
                    updates_1.append(line)

        # Next, update the tracer numbers (both total and individual)
        this_trc_num = 0

        # Loop over lines in list created above
        for line in updates_1:

            # Update total number of tracers
            if 'Number of Tracers' in line:
                ind_col = line.find(':') + 2
                txt_update = str(num_tracers) + '\n'
                updates_2.append(line.replace(line[ind_col:],txt_update))
                print '\nold: ' + line,
                print 'new: ' + line.replace(line[ind_col:],txt_update)

            # Update tracer number for all tracers
            elif 'Tracer #' in line:
                this_trc_num += 1
                ind_tn = len('Tracer #') 
                tn = str(this_trc_num).ljust(4)
                temp = line.replace(line[ind_tn:ind_tn+4],tn)
                updates_2.append(temp)
                print 'old: ' + line, # for validation
                print 'new: ' + temp  # for validation

            # Otherwise, simply copy line
            else:
                updates_2.append(line)    

        # Write to temporary file        
        temppath = os.path.join(root, tempfile)
        print 'Writing to file: ', temppath, '\n'
        with open(temppath, 'w') as f:
            for line in updates_2:
                f.write(line)

        # Rename files (archive the original and rename temp to orig name)
        os.rename(fpath, os.path.join(root, archive))
        os.rename(temppath, os.path.join(root, fname))
