import pandas as pd
import xarray as xr
import numpy as np

# Specify file path and file names
InFile = 'GEOSChem.Hourly_SfcO3.Emis2017.nc'

ds = xr.open_dataset(InFile)
#print(ds)

o3_data = ds['SpeciesConc_O3'] #.values

# Compute the 8-hour rolling averages for ozone
avg_8hr_o3 = (o3_data.rolling(time=8, min_periods=6).mean())

# By default, this takes the last timestamp in a rolling interval; i.e. the
# timestamps correspond to the preceding 8 hours. We want them to refer to
# the proceding 8 hours, so we can adjust them using datetime arithmetic
times_np = avg_8hr_o3.time.values
times_pd = pd.to_datetime(times_np) - pd.Timedelta('8h')
avg_8hr_o3.time.values[:] = times_pd


# Finally, aggregate by calendar day and compute the maxima of the set of
# 8-hour averages for each day
mda8_o3 = avg_8hr_o3.resample(time='D').max(dim='time')
mda8_o3.name='mda8_o3'
print(mda8_o3)

mda8_o3.to_netcdf('GEOSChem.MDA8_O3.Emis2017.nc', 'w', format='NETCDF4',
                  encoding={'lat': {'_FillValue': None}, 
                            'lon': {'_FillValue': None}, 
                            'time': {'_FillValue': None},
                            'mda8_o3': {'_FillValue': None}})
