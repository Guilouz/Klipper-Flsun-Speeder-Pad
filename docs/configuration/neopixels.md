# Use Neopixels Ring Light

![Neopixels](https://user-images.githubusercontent.com/12702322/189089546-0705b277-79d4-4a16-bd79-75cb2c6bc493.png)

## Macros

- Turn On Neopixels with `NEOPIXEL_ON` macro
- Turn Off Neopixels with `NEOPIXEL_OFF` macro
- Turn On Neopixels in blue with `NEOPIXEL_BLUE` macro
- Turn On Neopixels in red with `NEOPIXEL_RED` macro
- Turn On Neopixels in green with `NEOPIXEL_GREEN` macro
- Turn On Neopixels in yellow with `NEOPIXEL_YELLOW` macro
- Turn On Neopixels in orange with `NEOPIXEL_ORANGE` macro
- Turn On Neopixels in violet with `NEOPIXEL_VIOLET` macro
- Turn on Neopixels based on nozzle temperature (All LEDs) with `HOTEND_GLOW` macro
- Turn on Neopixels based on nozzle temperature (LED by LED) with `HOTEND_PROGRESS` macro
- Turn on Neopixels based on bed temperature (All LEDs) with `BED_GLOW` macro
- Turn on Neopixels based on bed temperature (LED by LED) with `BED_PROGRESS` macro
- Turn on Neopixels based on printing progress (All LEDs) with `PERCENT_GLOW` macro
- Turn on Neopixels based on printing progress (LED by LED) with `PERCENT_PROGRESS` macro
- Turn on Neopixels based on printing speed (All LEDs) with `SPEED_GLOW` macro
- Turn on Neopixels based on printing speed (LED by LED) with `SPEED_PROGRESS` macro

## Requirements

- Neon Flexible Tube 1m T1616-Side 10mm PCB: [Here](https://fr.aliexpress.com/item/4000095850068.html?spm=a2g0o.store_pc_allProduct.8148356.60.19667739Amjjs4&pdp_npi=2%40dis%21EUR%21%E2%82%AC%2013%2C34%21%E2%82%AC%209%2C34%21%21%21%21%21%402100bddd16626284472777282ed43e%2112000015942927508%21sh)

- LED Strip WS2812 1 m 60 IP 30: [Here](https://fr.aliexpress.com/item/4001322411818.html?spm=a2g0o.productlist.0.0.456f5656HRHoUB&algo_pvid=50309f27-48b8-4454-839b-91200ed7636a&algo_exp_id=50309f27-48b8-4454-839b-91200ed7636a-1&pdp_ext_f=%7B%22sku_id%22%3A%2212000029452067850%22%7D&pdp_npi=2%40dis%21EUR%215.33%213.52%21%21%21%21%21%40210318b816680797236251936e4806%2112000029452067850%21sea&curPageLogUid=B9A6EyfUBAps)

- Cable Ties 2.5mm

- Support (STL) : [Here](https://www.printables.com/model/272995-flsun-neopixels-ring-light-support)

## Wiring

### v400 (MKS Robin Nano V2.0)

![wiring](https://user-images.githubusercontent.com/12702322/189106620-6ebc2983-be6f-4fb2-a36e-89bb4cd7e54b.png)

### Super Racer (MKS Robin Nano V3.0/V3.1)

![wiring](https://user-images.githubusercontent.com/12702322/197017354-f78b9ec9-e959-41ba-b178-14a05bc11da8.png)

### Super Racer (BigTreeTech SKR 1.3)

![wiring](https://user-images.githubusercontent.com/12702322/197060341-a616cc7e-d92d-47be-963e-61aeb41b734b.jpg)


## Configuration

Go to your Mainsail Web interface then click on `Machine` tab.

Open the `printer.cfg` file and modify the following line by removing the `#` at the very beginning:

```
[include neopixels.cfg]  #Enable if you want to use Neopixels
```

Now open the `KlipperScreen.conf` file and copy all of this code just before line `#~# --- Do not edit below this line. This section is auto generated --- #~#`:

```
[menu __main actions neopixels]
name: {{ gettext('Neopixels') }}
icon: neopixels

[menu __main actions neopixels led_off]
name: {{ gettext('Off') }}
icon: neopixels-off
method: printer.gcode.script
params: {"script":"NEOPIXEL_OFF"}

[menu __main actions neopixels led_on]
name: {{ gettext('On') }}
icon: neopixels-on
method: printer.gcode.script
params: {"script":"NEOPIXEL_ON"}

[menu __main actions neopixels led_blue]
name: {{ gettext('Blue') }}
icon: neopixels-blue
method: printer.gcode.script
params: {"script":"NEOPIXEL_BLUE"}

[menu __main actions neopixels led_red]
name: {{ gettext('Red') }}
icon: neopixels-red
method: printer.gcode.script
params: {"script":"NEOPIXEL_RED"}

[menu __main actions neopixels led_green]
name: {{ gettext('Green') }}
icon: neopixels-green
method: printer.gcode.script
params: {"script":"NEOPIXEL_GREEN"}

[menu __main actions neopixels led_yellow]
name: {{ gettext('Yellow') }}
icon: neopixels-yellow
method: printer.gcode.script
params: {"script":"NEOPIXEL_YELLOW"}

[menu __main actions neopixels led_orange]
name: {{ gettext('Orange') }}
icon: neopixels-orange
method: printer.gcode.script
params: {"script":"NEOPIXEL_ORANGE"}

[menu __main actions neopixels led_violet]
name: {{ gettext('Violet') }}
icon: neopixels-violet
method: printer.gcode.script
params: {"script":"NEOPIXEL_VIOLET"}

[menu __main actions neopixels hotend_glow]
name: {{ gettext('Hotend (All)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_GLOW"}

[menu __main actions neopixels hotend_progress]
name: {{ gettext('Hotend (One by One)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_PROGRESS"}

[menu __main actions neopixels bed_glow]
name: {{ gettext('Bed (All)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_GLOW"}

[menu __main actions neopixels bed_progress]
name: {{ gettext('Bed (One by One)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_PROGRESS"}

[menu __main actions neopixels percent_glow]
name: {{ gettext('Progress (All)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_GLOW"}

[menu __main actions neopixels percent_progress]
name: {{ gettext('Progress (One by One)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_PROGRESS"}

[menu __main actions neopixels speed_glow]
name: {{ gettext('Speed (All)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_GLOW"}

[menu __main actions neopixels speed_progress]
name: {{ gettext('Speed (One by One)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_PROGRESS"}

[menu __print neopixels]
name: {{ gettext('Neopixels') }}
icon: neopixels

[menu __print neopixels led_off]
name: {{ gettext('Off') }}
icon: neopixels-off
method: printer.gcode.script
params: {"script":"NEOPIXEL_OFF"}

[menu __print neopixels led_on]
name: {{ gettext('On') }}
icon: neopixels-on
method: printer.gcode.script
params: {"script":"NEOPIXEL_ON"}

[menu __print neopixels led_blue]
name: {{ gettext('Blue') }}
icon: neopixels-blue
method: printer.gcode.script
params: {"script":"NEOPIXEL_BLUE"}

[menu __print neopixels led_red]
name: {{ gettext('Red') }}
icon: neopixels-red
method: printer.gcode.script
params: {"script":"NEOPIXEL_RED"}

[menu __print neopixels led_green]
name: {{ gettext('Green') }}
icon: neopixels-green
method: printer.gcode.script
params: {"script":"NEOPIXEL_GREEN"}

[menu __print neopixels led_yellow]
name: {{ gettext('Yellow') }}
icon: neopixels-yellow
method: printer.gcode.script
params: {"script":"NEOPIXEL_YELLOW"}

[menu __print neopixels led_orange]
name: {{ gettext('Orange') }}
icon: neopixels-orange
method: printer.gcode.script
params: {"script":"NEOPIXEL_ORANGE"}

[menu __print neopixels led_violet]
name: {{ gettext('Violet') }}
icon: neopixels-violet
method: printer.gcode.script
params: {"script":"NEOPIXEL_VIOLET"}

[menu __print neopixels hotend_glow]
name: {{ gettext('Hotend (All)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_GLOW"}

[menu __print neopixels hotend_progress]
name: {{ gettext('Hotend (One by One)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_PROGRESS"}

[menu __print neopixels bed_glow]
name: {{ gettext('Bed (All)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_GLOW"}

[menu __print neopixels bed_progress]
name: {{ gettext('Bed (One by One)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_PROGRESS"}

[menu __print neopixels percent_glow]
name: {{ gettext('Progress (All)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_GLOW"}

[menu __print neopixels percent_progress]
name: {{ gettext('Progress (One by One)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_PROGRESS"}

[menu __print neopixels speed_glow]
name: {{ gettext('Speed (All)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_GLOW"}

[menu __print neopixels speed_progress]
name: {{ gettext('Speed (One by One)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_PROGRESS"}
```

Once done, click on `SAVE & RESTART` at the top right to save the file.
