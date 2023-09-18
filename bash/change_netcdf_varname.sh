#!/bin/bash

FILE="HEMCO_diagnostics.201607010000.nc.new"

ncrename -h -v InvNH3_Seabirds,InvSEABIRDS_NH3 $FILE
ncrename -h -v InvALD2_CEDS,InvCEDS_ALD2 $FILE
ncrename -h -v InvALK4_CEDS,InvCEDS_ALK4 $FILE
ncrename -h -v InvBCPI_CEDS,InvCEDS_BCPI $FILE
ncrename -h -v InvBCPO_CEDS,InvCEDS_BCPO $FILE
ncrename -h -v InvBENZ_CEDS,InvCEDS_BENZ $FILE
ncrename -h -v InvC2H2_CEDS,InvCEDS_C2H2 $FILE
ncrename -h -v InvC2H4_CEDS,InvCEDS_C2H4 $FILE
ncrename -h -v InvC2H6_CEDS,InvCEDS_C2H6 $FILE
ncrename -h -v InvC3H8_CEDS,InvCEDS_C3H8 $FILE
ncrename -h -v InvCH2O_CEDS,InvCEDS_CH2O $FILE
ncrename -h -v InvCH4_CEDS,InvCEDS_CH4 $FILE
ncrename -h -v InvCO_CEDS,InvCEDS_CO $FILE
ncrename -h -v InvCO2_CEDS,InvCEDS_CO2 $FILE
ncrename -h -v InvEOH_CEDS,InvCEDS_EOH $FILE
ncrename -h -v InvHCOOH_CEDS,InvCEDS_HCOOH $FILE
ncrename -h -v InvMEK_CEDS,InvCEDS_MEK $FILE
ncrename -h -v InvNH3_CEDS,InvCEDS_NH3 $FILE
ncrename -h -v InvNO_CEDS,InvCEDS_NO $FILE
ncrename -h -v InvOCPI_CEDS,InvCEDS_OCPI $FILE
ncrename -h -v InvOCPO_CEDS,InvCEDS_OCPO $FILE
ncrename -h -v InvpFe_CEDS,InvCEDS_pFe $FILE
ncrename -h -v InvPOG1_CEDS,InvCEDS_POG1 $FILE
ncrename -h -v InvPOG2_CEDS,InvCEDS_POG2 $FILE
ncrename -h -v InvPRPE_CEDS,InvCEDS_PRPE $FILE
ncrename -h -v InvSO2_CEDS,InvCEDS_SO2 $FILE
ncrename -h -v InvSO4_CEDS,InvCEDS_SO4 $FILE
ncrename -h -v InvSOAP_CEDS,InvCEDS_SOAP $FILE
ncrename -h -v InvTOLU_CEDS,InvCEDS_TOLU $FILE
ncrename -h -v InvXYLE_CEDS,InvCEDS_XYLE $FILE
ncrename -h -v InvC3H8_BIOFUELyl,InvYLBIOFUEL_C3H8 $FILE
ncrename -h -v InvGLYC_BIOFUELyl,InvYLBIOFUEL_GLYC $FILE
ncrename -h -v InvGLYX_BIOFUELyl,InvYLBIOFUEL_GLYX $FILE
ncrename -h -v InvHAC_BIOFUELyl,InvYLBIOFUEL_HAC $FILE
ncrename -h -v InvMGLY_BIOFUELyl,InvYLBIOFUEL_MGLY $FILE
ncrename -h -v InvACET_RETRO,InvRETRO_ACET $FILE
ncrename -h -v InvALD2_RETRO,InvRETRO_ALD2 $FILE
ncrename -h -v InvALK4_RETRO,InvRETRO_ALK4 $FILE
ncrename -h -v InvC3H8_Xiao,InvXIAO_C3H8 $FILE
ncrename -h -v InvC2H6_C2H62010anth,InvC2H62010anth_C2H6 $FILE
ncrename -h -v InvC2H6_C2H62010biof,InvC2H62010biof_C2H6 $FILE
ncrename -h -v InvALD2_EMEP,InvEMEP_ALD2 $FILE
ncrename -h -v InvALK4_EMEP,InvEMEP_ALK4 $FILE
ncrename -h -v InvCO_EMEP,InvEMEP_CO $FILE
ncrename -h -v InvMEK_EMEP,InvEMEP_MEK $FILE
ncrename -h -v InvNH3_EMEP,InvEMEP_NH3 $FILE
ncrename -h -v InvNO_EMEP,InvEMEP_NO $FILE
ncrename -h -v InvpFe_EMEP,InvEMEP_pFe $FILE
ncrename -h -v InvPRPE_EMEP,InvEMEP_PRPE $FILE
ncrename -h -v InvSO2_EMEP,InvEMEP_SO2 $FILE
ncrename -h -v InvSO4_EMEP,InvEMEP_SO4 $FILE
ncrename -h -v InvSOAP_EMEP,InvEMEP_SOAP $FILE
ncrename -h -v InvBCPI_APEI,InvAPEI_BCPI $FILE
ncrename -h -v InvBCPO_APEI,InvAPEI_BCPO $FILE
ncrename -h -v InvCO_APEI,InvAPEI_CO $FILE
ncrename -h -v InvNH3_APEI,InvAPEI_NH3 $FILE
ncrename -h -v InvNO_APEI,InvAPEI_NO $FILE
ncrename -h -v InvOCPI_APEI,InvAPEI_OCPI $FILE
ncrename -h -v InvOCPO_APEI,InvAPEI_OCPO $FILE
ncrename -h -v InvpFe_APEI,InvAPEI_pFe $FILE
ncrename -h -v InvPOG1_APEI,InvAPEI_POG1 $FILE
ncrename -h -v InvPOG2_APEI,InvAPEI_POG2 $FILE
ncrename -h -v InvSO2_APEI,InvAPEI_SO2 $FILE
ncrename -h -v InvSO4_APEI,InvAPEI_SO4 $FILE
ncrename -h -v InvSOAP_APEI,InvAPEI_SOAP $FILE
ncrename -h -v InvACET_NEI2011,InvNEI2011_ACET $FILE
ncrename -h -v InvALD2_NEI2011,InvNEI2011_ALD2 $FILE
ncrename -h -v InvALK4_NEI2011,InvNEI2011_ALK4 $FILE
ncrename -h -v InvBCPI_NEI2011,InvNEI2011_BCPI $FILE
ncrename -h -v InvBCPO_NEI2011,InvNEI2011_BCPO $FILE
ncrename -h -v InvBENZ_NEI2011,InvNEI2011_BENZ $FILE
ncrename -h -v InvC2H4_NEI2011,InvNEI2011_C2H4 $FILE
ncrename -h -v InvC2H6_NEI2011,InvNEI2011_C2H6 $FILE
ncrename -h -v InvC3H8_NEI2011,InvNEI2011_C3H8 $FILE
ncrename -h -v InvCH2O_NEI2011,InvNEI2011_CH2O $FILE
ncrename -h -v InvCO_NEI2011,InvNEI2011_CO $FILE
ncrename -h -v InvEOH_NEI2011,InvNEI2011_EOH $FILE
ncrename -h -v InvHONO_NEI2011,InvNEI2011_HONO $FILE
ncrename -h -v InvMACR_NEI2011,InvNEI2011_MACR $FILE
ncrename -h -v InvMEK_NEI2011,InvNEI2011_MEK $FILE
ncrename -h -v InvMOH_NEI2011,InvNEI2011_MOH $FILE
ncrename -h -v InvNH3_NEI2011,InvNEI2011_NH3 $FILE
ncrename -h -v InvNO_NEI2011,InvNEI2011_NO $FILE
ncrename -h -v InvNO2_NEI2011,InvNEI2011_NO2 $FILE
ncrename -h -v InvpFe_NEI2011,InvNEI2011_pFe $FILE
ncrename -h -v InvPRPE_NEI2011,InvNEI2011_PRPE $FILE
ncrename -h -v InvOCPI_NEI2011,InvNEI2011_OCPI $FILE
ncrename -h -v InvOCPO_NEI2011,InvNEI2011_OCPO $FILE
ncrename -h -v InvRCHO_NEI2011,InvNEI2011_RCHO $FILE
ncrename -h -v InvSO2_NEI2011,InvNEI2011_SO2 $FILE
ncrename -h -v InvSO4_NEI2011,InvNEI2011_SO4 $FILE
ncrename -h -v InvSOAP_NEI2011,InvNEI2011_SOAP $FILE
ncrename -h -v InvTOLU_NEI2011,InvNEI2011_TOLU $FILE
ncrename -h -v InvXYLE_NEI2011,InvNEI2011_XYLE $FILE
ncrename -h -v InvACET_MIX,InvMIX_ACET $FILE
ncrename -h -v InvALD2_MIX,InvMIX_ALD2 $FILE
ncrename -h -v InvALK4_MIX,InvMIX_ALK4 $FILE
ncrename -h -v InvC2H6_MIX,InvMIX_C2H6 $FILE
ncrename -h -v InvC3H8_MIX,InvMIX_C3H8 $FILE
ncrename -h -v InvCH2O_MIX,InvMIX_CH2O $FILE
ncrename -h -v InvCO_MIX,InvMIX_CO $FILE
ncrename -h -v InvMEK_MIX,InvMIX_MEK $FILE
ncrename -h -v InvNH3_MIX,InvMIX_NH3 $FILE
ncrename -h -v InvNO_MIX,InvMIX_NO $FILE
ncrename -h -v InvpFe_MIX,InvMIX_pFe $FILE
ncrename -h -v InvPRPE_MIX,InvMIX_PRPE $FILE
ncrename -h -v InvSO2_MIX,InvMIX_SO2 $FILE
ncrename -h -v InvSO4_MIX,InvMIX_SO4 $FILE
ncrename -h -v InvSOAP_MIX,InvMIX_SOAP $FILE
ncrename -h -v InvACET_DICEAfrica,InvDICEAfrica_ACET $FILE
ncrename -h -v InvALD2_DICEAfrica,InvDICEAfrica_ALD2 $FILE
ncrename -h -v InvALK4_DICEAfrica,InvDICEAfrica_ALK4 $FILE
ncrename -h -v InvBCPI_DICEAfrica,InvDICEAfrica_BCPI $FILE
ncrename -h -v InvBCPO_DICEAfrica,InvDICEAfrica_BCPO $FILE
ncrename -h -v InvBENZ_DICEAfrica,InvDICEAfrica_BENZ $FILE
ncrename -h -v InvC2H2_DICEAfrica,InvDICEAfrica_C2H2 $FILE
ncrename -h -v InvC2H4_DICEAfrica,InvDICEAfrica_C2H4 $FILE
ncrename -h -v InvC2H6_DICEAfrica,InvDICEAfrica_C2H6 $FILE
ncrename -h -v InvC3H8_DICEAfrica,InvDICEAfrica_C3H8 $FILE
ncrename -h -v InvCH2O_DICEAfrica,InvDICEAfrica_CH2O $FILE
ncrename -h -v InvCO_DICEAfrica,InvDICEAfrica_CO $FILE
ncrename -h -v InvHAC_DICEAfrica,InvDICEAfrica_HAC $FILE
ncrename -h -v InvHCOOH_DICEAfrica,InvDICEAfrica_HCOOH $FILE
ncrename -h -v InvGLYC_DICEAfrica,InvDICEAfrica_GLYC $FILE
ncrename -h -v InvISOP_DICEAfrica,InvDICEAfrica_ISOP $FILE
ncrename -h -v InvMACR_DICEAfrica,InvDICEAfrica_MACR $FILE
ncrename -h -v InvMEK_DICEAfrica,InvDICEAfrica_MEK $FILE
ncrename -h -v InvMOH_DICEAfrica,InvDICEAfrica_MOH $FILE
ncrename -h -v InvMVK_DICEAfrica,InvDICEAfrica_MVK $FILE
ncrename -h -v InvNH3_DICEAfrica,InvDICEAfrica_NH3 $FILE
ncrename -h -v InvNO_DICEAfrica,InvDICEAfrica_NO $FILE
ncrename -h -v InvNO2_DICEAfrica,InvDICEAfrica_NO2 $FILE
ncrename -h -v InvOCPI_DICEAfrica,InvDICEAfrica_OCPI $FILE
ncrename -h -v InvOCPO_DICEAfrica,InvDICEAfrica_OCPO $FILE
ncrename -h -v InvpFe_DICEAfrica,InvDICEAfrica_pFe $FILE
ncrename -h -v InvPRPE_DICEAfrica,InvDICEAfrica_PRPE $FILE
ncrename -h -v InvRCHO_DICEAfrica,InvDICEAfrica_RCHO $FILE
ncrename -h -v InvSO2_DICEAfrica,InvDICEAfrica_SO2 $FILE
ncrename -h -v InvSO4_DICEAfrica,InvDICEAfrica_SO4 $FILE
ncrename -h -v InvSOAP_DICEAfrica,InvDICEAfrica_SOAP $FILE
ncrename -h -v InvTOLU_DICEAfrica,InvDICEAfrica_TOLU $FILE
ncrename -h -v InvXYLE_DICEAfrica,InvDICEAfrica_XYLE $FILE
ncrename -h -v InvCH2Br2_LIANG,InvLIANG_CH2Br2 $FILE
ncrename -h -v InvCHBr3_LIANG,InvLIANG_CHBr3 $FILE
ncrename -h -v InvCH2I2_ORDONEZ,InvORDONEZ_CH2I2 $FILE
ncrename -h -v InvCH2ICl_ORDONEZ,InvORDONEZ_CH2ICl $FILE
ncrename -h -v InvCH2IBr_ORDONEZ,InvORDONEZ_CH2IBr $FILE
ncrename -h -v InvCH3I_ORDONEZ,InvORDONEZ_CH3I $FILE
ncrename -h -v InvSO2_ARCTASship,InvARCTASship_SO2 $FILE
ncrename -h -v InvCO_ICOADSship,InvICOADSship_CO $FILE
ncrename -h -v InvSOAP_ICOADSship,InvICOADSship_SOAP $FILE
ncrename -h -v InvACET_CEDSship,InvCEDSship_ACET $FILE
ncrename -h -v InvALD2_CEDSship,InvCEDSship_ALD2 $FILE
ncrename -h -v InvALK4_CEDSship,InvCEDSship_ALK4 $FILE
ncrename -h -v InvBCPI_CEDSship,InvCEDSship_BCPI $FILE
ncrename -h -v InvBCPO_CEDSship,InvCEDSship_BCPO $FILE
ncrename -h -v InvBENZ_CEDSship,InvCEDSship_BENZ $FILE
ncrename -h -v InvC2H2_CEDSship,InvCEDSship_C2H2 $FILE
ncrename -h -v InvC2H4_CEDSship,InvCEDSship_C2H4 $FILE
ncrename -h -v InvC2H6_CEDSship,InvCEDSship_C2H6 $FILE
ncrename -h -v InvC3H8_CEDSship,InvCEDSship_C3H8 $FILE
ncrename -h -v InvCH2O_CEDSship,InvCEDSship_CH2O $FILE
ncrename -h -v InvCO_CEDSship,InvCEDSship_CO $FILE
ncrename -h -v InvEOH_CEDSship,InvCEDSship_EOH $FILE
ncrename -h -v InvHCOOH_CEDSship,InvCEDSship_HCOOH $FILE
ncrename -h -v InvMEK_CEDSship,InvCEDSship_MEK $FILE
ncrename -h -v InvNH3_CEDSship,InvCEDSship_NH3 $FILE
ncrename -h -v InvpFe_CEDSship,InvCEDSship_pFe $FILE
ncrename -h -v InvPRPE_CEDSship,InvCEDSship_PRPE $FILE
ncrename -h -v InvOCPI_CEDSship,InvCEDSship_OCPI $FILE
ncrename -h -v InvOCPO_CEDSship,InvCEDSship_OCPO $FILE
ncrename -h -v InvSO2_CEDSship,InvCEDSship_SO2 $FILE
ncrename -h -v InvSO4_CEDSship,InvCEDSship_SO4 $FILE
ncrename -h -v InvSOAP_CEDSship,InvCEDSship_SOAP $FILE
ncrename -h -v InvTOLU_CEDSship,InvCEDSship_TOLU $FILE
ncrename -h -v InvXYLE_CEDSship,InvCEDSship_XYLE $FILE
ncrename -h -v InvCO_EMEPship,InvEMEPship_CO $FILE
ncrename -h -v InvSO2_EMEPship,InvEMEPship_SO2 $FILE
ncrename -h -v InvSOAP_EMEPship,InvEMEPship_SOAP $FILE
ncrename -h -v InvPOG1_BONDanthro,InvBONDanthro_POG1 $FILE
ncrename -h -v InvPOG2_BONDanthro,InvBONDanthro_POG2 $FILE
ncrename -h -v InvPOG1_BONDbiofuel,InvBONDbiofuel_POG1 $FILE
ncrename -h -v InvPOG2_BONDbiofuel,InvBONDbiofuel_POG2 $FILE
ncrename -h -v InvACET_AEIC,InvAEIC_ACET $FILE
ncrename -h -v InvALD2_AEIC,InvAEIC_ALD2 $FILE
ncrename -h -v InvALK4_AEIC,InvAEIC_ALK4 $FILE
ncrename -h -v InvBCPI_AEIC,InvAEIC_BCPI $FILE
ncrename -h -v InvC2H6_AEIC,InvAEIC_C2H6 $FILE
ncrename -h -v InvC3H8_AEIC,InvAEIC_C3H8 $FILE
ncrename -h -v InvCH2O_AEIC,InvAEIC_CH2O $FILE
ncrename -h -v InvCO_AEIC,InvAEIC_CO $FILE
ncrename -h -v InvMACR_AEIC,InvAEIC_MACR $FILE
ncrename -h -v InvNO_AEIC,InvAEIC_NO $FILE
ncrename -h -v InvOCPI_AEIC,InvAEIC_OCPI $FILE
ncrename -h -v InvPRPE_AEIC,InvAEIC_PRPE $FILE
ncrename -h -v InvRCHO_AEIC,InvAEIC_RCHO $FILE
ncrename -h -v InvSO2_AEIC,InvAEIC_SO2 $FILE
ncrename -h -v InvSO4_AEIC,InvAEIC_SO4 $FILE
ncrename -h -v InvSOAP_AEIC,InvAEIC_SOAP $FILE
ncrename -h -v InvALD2_PLANTDECAY,InvPLANTDECAY_ALD2 $FILE
ncrename -h -v InvEOH_PLANTDECAY,InvPLANTDECAY_EOH $FILE
ncrename -h -v InvSO2_VOLCerupt,InvVOLCANOerupt_SO2 $FILE
ncrename -h -v InvSO2_VOLCdegas,InvVOLCANdegas_SO2 $FILE
ncrename -h -v InvACET_SeaFlux,InvSeaFlux_ACET $FILE
ncrename -h -v InvALD2_SeaFlux,InvSeaFlux_ALD2 $FILE
ncrename -h -v InvDMS_SeaFlux,InvSeaFlux_DMS $FILE
ncrename -h -v InvCH3I_SeaFlux,InvSeaFlux_CH3I $FILE
ncrename -h -v InvHNO3_PARANOX,InvPARANOX_HNO3 $FILE
ncrename -h -v InvNO_PARANOX,InvPARANOX_NO $FILE
ncrename -h -v InvNO2_PARANOX,InvPARANOX_NO2 $FILE
ncrename -h -v InvO3_PARANOX,InvPARANOX_O3 $FILE
ncrename -h -v InvNO_LIGHTNOX,InvLIGHTNOX_NO $FILE
ncrename -h -v InvNO_SOILNOX,InvOFFLINESOILNOX_NO $FILE
ncrename -h -v InvDST1_DEAD,InvOFFLINEDUST_DST1 $FILE
ncrename -h -v InvDST2_DEAD,InvOFFLINEDUST_DST2 $FILE
ncrename -h -v InvDST3_DEAD,InvOFFLINEDUST_DST3 $FILE
ncrename -h -v InvDST4_DEAD,InvOFFLINEDUST_DST4 $FILE
ncrename -h -v InvBr2_SeaSalt,InvOFFLINESEASALT_Br2 $FILE
ncrename -h -v InvBrSALA_SeaSalt,InvOFFLINESEASALT_BrSALA $FILE
ncrename -h -v InvBrSALA_SeaSall,InvOFFLINESEASALT_BrSALC $FILE
ncrename -h -v InvSALA_SeaSalt,InvOFFLINESEASALT_SALA $FILE
ncrename -h -v InvSALC_SeaSalt,InvOFFLINESEASALT_SALC $FILE
ncrename -h -v InvACET_MEGAN,InvOFFLINEBIOVOC_ACET $FILE
ncrename -h -v InvALD2_MEGAN,InvOFFLINEBIOVOC_ALD2 $FILE
ncrename -h -v InvC2H4_MEGAN,InvOFFLINEBIOVOC_C2H4 $FILE
ncrename -h -v InvDMS_MEGAN,InvOFFLINEBIOVOC_DMS $FILE
ncrename -h -v InvEOH_MEGAN,InvOFFLINEBIOVOC_EOH $FILE
ncrename -h -v InvISOP_MEGAN,InvOFFLINEBIOVOC_ISOP $FILE
ncrename -h -v InvPRPE_MEGAN,InvOFFLINEBIOVOC_PRPE $FILE
ncrename -h -v InvSOAP_MEGAN,InvOFFLINEBIOVOC_SOAP $FILE
ncrename -h -v InvSOAS_MEGAN,InvOFFLINEBIOVOC_SOAS $FILE
ncrename -h -v InvCO_MEGANmono,InvOFFLINEBIOVOC_CO $FILE
ncrename -h -v InvLIMO_MEGANmono,InvOFFLINEBIOVOC_LIMO $FILE
ncrename -h -v InvMTPA_MEGANmono,InvOFFLINEBIOVOC_MTPA $FILE
ncrename -h -v InvMTPO_MEGANmono,InvOFFLINEBIOVOC_MTPO $FILE
ncrename -h -v InvSESQ_MEGANmono,InvOFFLINEBIOVOC_SESQ $FILE
ncrename -h -v InvACET_GFED,InvGFED_ACET $FILE
ncrename -h -v InvALD2_GFED,InvGFED_ALD2 $FILE
ncrename -h -v InvALK4_GFED,InvGFED_ALK4 $FILE
ncrename -h -v InvBCPI_GFED,InvGFED_BCPI $FILE
ncrename -h -v InvBCPO_GFED,InvGFED_BCPO $FILE
ncrename -h -v InvBENZ_GFED,InvGFED_BENZ $FILE
ncrename -h -v InvC2H6_GFED,InvGFED_C2H6 $FILE
ncrename -h -v InvC3H8_GFED,InvGFED_C3H8 $FILE
ncrename -h -v InvCH2O_GFED,InvGFED_CH2O $FILE
ncrename -h -v InvCO_GFED,InvGFED_CO $FILE
ncrename -h -v InvEOH_GFED,InvGFED_EOH $FILE
ncrename -h -v InvMEK_GFED,InvGFED_MEK $FILE
ncrename -h -v InvMTPA_GFED,InvGFED_MTPA $FILE
ncrename -h -v InvNAP_GFED,InvGFED_NAP $FILE
ncrename -h -v InvNH3_GFED,InvGFED_NH3 $FILE
ncrename -h -v InvNO_GFED,InvGFED_NO $FILE
ncrename -h -v InvOCPI_GFED,InvGFED_OCPI $FILE
ncrename -h -v InvOCPO_GFED,InvGFED_OCPO $FILE
ncrename -h -v InvPOG1_GFED,InvGFED_POG1 $FILE
ncrename -h -v InvPOG2_GFED,InvGFED_POG2 $FILE
ncrename -h -v InvPRPE_GFED,InvGFED_PRPE $FILE
ncrename -h -v InvSO2_GFED,InvGFED_SO2 $FILE
ncrename -h -v InvSOAP_GFED,InvGFED_SOAP $FILE
ncrename -h -v InvTOLU_GFED,InvGFED_TOLU $FILE
ncrename -h -v InvXYLE_GFED,InvGFED_XYLE $FILE
ncrename -h -v InvHOI_IODINE,InvIODINE_HOI $FILE
ncrename -h -v InvI2_IODINE,InvIODINE_I2 $FILE

exit 0
