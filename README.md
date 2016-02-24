# RemoteSwitch_v2
RF remote light switch with 10mW 433.92MHz TX

# EMITTER
- STM8L101F2 (ST 8bit low cost low power micro) @ 3.0V
- Hope RF RFM85W 433.92MHz emitter
- CR2032 battery operated (0.4uA sleep current)
- Manchester encoding

# RECEIVER
- STM8L101F2 (ST 8bit low cost low power micro) @ 3.3V
- LNK304 (non isolated buck coverter 230VAC to 9V DC)
- MOC3063 (optotriac)
- BT136 (triac)
- Hope RF RFM83CL 433.92Mhz receiver
- Manchester decoding
