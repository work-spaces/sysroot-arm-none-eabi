"""

"""

add_prefix = "sysroot"
link_type = "Hard"

macos_aarch64 = {
    "url": "https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi.tar.xz",
    "sha256": "21a9e875250bcb0db8df4cb23dd43c94c00a1d3b98ecba9cdd6ed51586b12248",
    "add_prefix": add_prefix,
    "strip_prefix": "arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi",
    "excludes": ["arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi/share/**"],
    "link": link_type,
}

macos_x86_64 = {
    "url": "https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi.tar.xz",
    "sha256": "00c0eeb57ae92332f216151ac66df6ba17d2d3b306dac86f4006006f437b2902",
    "add_prefix": add_prefix,
    "strip_prefix": "arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi",
    "excludes": ["arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi/share/**"],
    "link": link_type,
}

checkout.add_platform_archive(
    rule = {"name": "arm-none-eabi-toolchain"},
    platforms = {
        "macos_x86_64": macos_x86_64,
        "macos_aarch64": macos_aarch64,
    },
)

toolchain_contents = fs.read("{}/toolchain.cmake".format(info.current_workspace_path()))

checkout.add_asset(
    rule = {"name": "toolchain-cmake"},
    asset = {
        "destination": "sysroot/cmake/arm-none-eabi-toolchain.cmake",
        "content": toolchain_contents,
    },
)

checkout.update_env(
    rule = {"name": "toolchain-cmake-env"},
    env = {
        "vars": {
            "SYSROOT_ARM_NONE_EABI_TOOLCHAIN_CMAKE": "sysroot/cmake/arm-none-eabi-toolchain.cmake",
        },
        "paths": []
    }
)
