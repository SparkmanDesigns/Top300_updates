:: If VDMSound is installed and automatic settings for CYB.CFG are allowed by the user, make some adjustments with SED
IF EXIST "%VDMSPath%/dosdrv.exe" (
IF EXIST ./SSP/flags/auto_cyb (
COPY /A /V /Y CYB.CFG SED\CYB.CFG~TEMP >nul
CD SED
sed.exe -e "s:digi_list.*:digi_list 3:g" -e "s:digi_card.*:digi_card 3:g" -e "s:digi_irq.*:digi_irq -1:g" <CYB.CFG~TEMP >CYB.CFG
CD ..
ATTRIB -R CYB.CFG
COPY /A /V /Y SED\CYB.CFG CYB.CFG >nul
ATTRIB +R CYB.CFG
DEL SED\CYB.CFG~TEMP
DEL SED\CYB.CFG
)
%VDMSPath%/dosdrv.exe "-i:vdms.ini"
) ELSE (
IF EXIST ./SSP/flags/auto_cyb (
COPY /A /V /Y CYB.CFG SED\CYB.CFG~TEMP >nul
CD SED
sed.exe -e "s:digi_list.*:digi_list 10:g" -e "s:digi_card.*:digi_card 1:g" -e "s:digi_irq.*:digi_irq -1:g" <CYB.CFG~TEMP >CYB.CFG
CD ..
ATTRIB -R CYB.CFG
COPY /A /V /Y SED\CYB.CFG CYB.CFG >nul
ATTRIB +R CYB.CFG
DEL SED\CYB.CFG~TEMP
DEL SED\CYB.CFG
))
dgvesa
cdshock