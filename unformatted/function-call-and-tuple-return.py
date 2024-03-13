def step():
    original_address = 0xffff_ffff
    byte_address = 5 << 16
    pm_size = 0xffff
    truncate = False
    overflow_saturation = True
    modulo_support = False
    address = step0(original_address, byte_address, pm_size, truncate, overflow_saturation, modulo_support)
    address, byte_address, pm_size, truncate, overflow_saturation, modulo_support = step1(original_address, address, byte_address, pm_size, truncate, overflow_saturation, modulo_support)
    return (address, byte_address, pm_size, truncate, overflow_saturation, modulo_support)

