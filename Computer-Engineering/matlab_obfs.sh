#!/bin/bash
OUTPUT_FILENAME=IsingSimulation.m

cp IsingSimulationFinal.txt encrypted.m
for var_name in expect_turn temperature calculate_time conditions_of_spins calculate_time total_energy_before_flip total_energy_after_flip mean_condition total_energy_before_flip test_flip delta_energy possibility_of_slip possibility_random time
do
	echo Renaming variable: ${var_name};
	sed -i "s/${var_name}/variable_$(uuidgen|tr '-' '_')/g" encrypted.m;
done
sed -i 's/%.*//g' encrypted.m
sed -i '/^[[:space:]]*$/d' encrypted.m
sed -i 's/$/;/' encrypted.m
cat encrypted.m | tr -d '\r\n' > $OUTPUT_FILENAME
sed -i 's/\.\.\.;//g' $OUTPUT_FILENAME
sed -i 's/ [[:space:]]*/ /g' $OUTPUT_FILENAME
sed -i 's/[[:space:]]*;[[:space:]]*/;/g' $OUTPUT_FILENAME
sed -i 's/;;/;/g' $OUTPUT_FILENAME
rm encrypted.m
