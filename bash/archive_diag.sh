#!/bin/bash

mkdir -p DiagOutput

mkdir -p DiagOutput/SpeciesConc
mkdir -p DiagOutput/AerosolMass
mkdir -p DiagOutput/Aerosols
mkdir -p DiagOutput/CloudConvFlux
mkdir -p DiagOutput/ConcAfterChem
mkdir -p DiagOutput/DryDep
mkdir -p DiagOutput/JValues
mkdir -p DiagOutput/JValuesLocalNoon
mkdir -p DiagOutput/LevelEdgeDiags
mkdir -p DiagOutput/ProdLoss
mkdir -p DiagOutput/StateChm
mkdir -p DiagOutput/StateMet
mkdir -p DiagOutput/WetLossConv
mkdir -p DiagOutput/WetLossLS
mkdir -p DiagOutput/HEMCO

mv ./GEOSChem.SpeciesConc*         DiagOutput/SpeciesConc        
mv ./GEOSChem.AerosolMass*	   DiagOutput/AerosolMass	   
mv ./GEOSChem.Aerosols*	           DiagOutput/Aerosols	   
mv ./GEOSChem.CloudConvFlux*	   DiagOutput/CloudConvFlux	   
mv ./GEOSChem.ConcAfterChem*	   DiagOutput/ConcAfterChem	   
mv ./GEOSChem.DryDep*		   DiagOutput/DryDep		   
mv ./GEOSChem.JValuesLocalNoon*    DiagOutput/JValuesLocalNoon   
mv ./GEOSChem.JValues*		   DiagOutput/JValues		   
mv ./GEOSChem.LevelEdgeDiags*	   DiagOutput/LevelEdgeDiags	   
mv ./GEOSChem.ProdLoss*	           DiagOutput/ProdLoss	   
mv ./GEOSChem.StateChm*	           DiagOutput/StateChm	   
mv ./GEOSChem.StateMet*	           DiagOutput/StateMet	   
mv ./GEOSChem.WetLossConv*	   DiagOutput/WetLossConv	   
mv ./GEOSChem.WetLossLS*           DiagOutput/WetLossLS    
mv ./HEMCO_diagnostics.*           DiagOutput/HEMCO      
