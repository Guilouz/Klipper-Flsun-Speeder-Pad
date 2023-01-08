# Slicer Side Changes

Change your Start and End Gcode in your Slicer settings like this:

## Cura

### Start GCode

```
;Nozzle diameter = {machine_nozzle_size}
;Filament type = {material_type}
;Filament name = {material_brand} {material_name}
;Filament weight = {filament_weight}
;M109 S{material_print_temperature}
;M190 S{material_bed_temperature}

START_PRINT BED_TEMP={material_bed_temperature_layer_0} EXTRUDER_TEMP={material_print_temperature_layer_0}
```

### End GCode

```
END_PRINT
```
    
## PrusaSlicer / SuperSlicer

### Start GCode

```
START_PRINT BED_TEMP=[first_layer_bed_temperature] EXTRUDER_TEMP=[first_layer_temperature]
M104 S[first_layer_temperature]
M190 S[first_layer_bed_temperature]
```

### End GCode

```
END_PRINT
```

## LycheeSlicer

### Start GCode

```
START_PRINT BED_TEMP={bed_temp} EXTRUDER_TEMP={temp}
```

### End GCode

```
END_PRINT
```

Next move onto [Firmware Retraction](firmware-retraction.md).