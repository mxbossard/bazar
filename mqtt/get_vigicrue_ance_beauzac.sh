#! /bin/sh

ts="$( date +'%s' )000"
vigicrueUrl="https://www.vigicrues.gouv.fr/services/observations.json/index.php?CdStationHydro=K054301001&GrdSerie=H&FormatSortie=simple&callback=result&_=$ts"

pattern="s/.*,(\[[0-9]+,-?[\.0-9]+\])[^,]+$/\1/g"

lastVigicrueArrayData=$( curl "$vigicrueUrl" | sed -re "$pattern" )
lastVigicrueData=$( echo $lastVigicrueArrayData | sed -re "s/.*,([^]]+)\]$/\1/g" )

echo $lastVigicrueData
