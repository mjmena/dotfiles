{ ... }:
{
  config.marty.nixosModules = [
    ({ ... }: {
      boot = {
        consoleLogLevel = 0;
        initrd.verbose = false;
        plymouth.enable = true;
        kernelParams = [
          "quiet"
          "rd.systemd.show_status=false"
          "rd.udev.log_level=3"
          "udev.log_priority=3"
          "boot.shell_on_fail"
          "amdgpu.sg_display=0"
        ];

        loader = {
          timeout = 5;
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = true;
        };
      };
    })
  ];
}
