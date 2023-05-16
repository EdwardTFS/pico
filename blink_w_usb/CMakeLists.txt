if (TARGET tinyusb_device)
    add_executable(blink_w_usb
            blink_w_usb.c
            )

    # pull in common dependencies
    target_link_libraries(blink_w_usb pico_stdlib)

    # enable usb output, disable uart output
    pico_enable_stdio_usb(blink_w_usb 1)
    pico_enable_stdio_uart(blink_w_usb 0)

    # create map/bin/hex/uf2 file etc.
    pico_add_extra_outputs(blink_w_usb)

    # add url via pico_set_program_url
    auto_set_git_url(hello_usb)
elseif(PICO_ON_DEVICE)
    message(WARNING "not building blink_w_usb because TinyUSB submodule is not initialized in the SDK")
endif()
